最近《阴阳师》更新后，cg播放黑屏了。 pm clear 无效，但下载最新的apk重装可以解决问题。

#### 一开始报错日志如下：

```
05-21 21:33:43.785  6386  6614 I tv.danmaku.ijk.media.player.IjkMediaPlayer: onSelectCodec: mime=video/avc, profile=100, level=30
05-21 21:33:43.805  6386  6614 W tv.danmaku.ijk.media.player.IjkMediaPlayer: unaccetable codec: OMX.ffmpeg.h264.decoder
05-21 21:33:43.805  6386  6614 E IJKMEDIA: amc: no suitable codec
```	
	
用的是B站开源的 IjkMediaPlayer，这里报错是因为没有找到合适的解码器，查找范围是通过 ```MediaCodecList.getCodecInfoAt ``` 获取系统所支持的解码器，根据名称来筛选合适的解码器，具体的逻辑看下面代码。 在系统解码器没有命中的情况下，IjkMediaPlayer 有自带的 ffmpeg 解码器。 但自带的 ffmpeg 这个解码器播放失败了。我又试了下原生的 IjkMediaPlayer 播放是否正常，其实原生的 IjkMediaPlayer 播放是正常的，所以我怀疑是 《阴阳师》 定制时修改出了问题。以下是各个apk在各个平台的播放情况：

| apk | 真机 | 容器 |
| ----| ---- | --- |
|《阴阳师》升级 | Ijk + media.codec | Ijk.ffmpeg(播放黑屏） |
|《阴阳师》最新 | Ijk + media.codec| MediaPlayer |
| Demo | Ijk.ffmpeg | Ijk.ffmpeg| 


既然原生的 Ijk 播放器没问题，我尝试看下《阴阳师》做了什么改动导致播放黑屏，继续对比日志发现《阴阳师》还有个异常的日志：

```
05-20 17:41:24.692 12757 13028 W IJKMEDIA: SDL_VoutFFmpeg_CreateOverlay(w=800, h=450, fmt=(0x0, dp=0xc06d81a0)
```
正常的应该是：

```
05-20 16:38:29.539  7717  7796 D IJKMEDIA: SDL_VoutFFmpeg_CreateOverlay(w=800, h=450, fmt=RV32(0x32335652, dp=0x76930a8ac980)
```

这个日志是 Ijk 输出的，从 Ijk 源码找到对应的含义是解码后的 像素格式是 0。反编译《阴阳师》的 libijksdk.so 这个库，发现它改了：

![](./yys_libijksdk.png)
	
### 1. java 层 new ```IjkMediaPlayer``` 后，其构造函数调用 native_setup 在 native 层做以下初始化：

1. 创建结构体 IjkMediaPlayer 及其成员 FFPlayer：
	
	```mp``` -> ```ffplayer``` -> ```vout``` -> ```opaque```
			  
	
	```
	IjkMediaPlayer *ijkmp_create(int (*msg_loop)(void*))
	{
	    IjkMediaPlayer *mp = (IjkMediaPlayer *) mallocz(sizeof(IjkMediaPlayer));
	    ...
	    mp->ffplayer = ffp_create();
	    mp->msg_loop = msg_loop;
		...
	}
	```
		
### 2. prepare
	
java 调用 prepare 后，native 创建3个线程：

```
static int ijkmp_prepare_async_l(IjkMediaPlayer *mp) {
    ...
    mp->msg_thread = SDL_CreateThreadEx(&mp->_msg_thread, ijkmp_msg_loop, mp, "ff_msg_loop");// 创建消息处理线程
    
    int retval = ffp_prepare_async_l(mp->ffplayer, mp->data_source);
    if (retval < 0) {
        ijkmp_change_state_l(mp, MP_STATE_ERROR);
        return retval;
    }
	
    return 0;
}
	
static VideoState *stream_open(FFPlayer *ffp, const char *filename, AVInputFormat *iformat){
	VideoState *is;
	is = av_mallocz(sizeof(VideoState));
	is->filename = av_strdup(filename);
	...
	is->video_refresh_tid = SDL_CreateThreadEx(&is->_video_refresh_tid, video_refresh_thread, ffp, "ff_vout");
	...
	is->read_tid = SDL_CreateThreadEx(&is->_read_tid, read_thread, ffp, "ff_read");
	...
}
```
	
read_thread 启动后就开始解析视频文件，从文件解析出来的音频、视频、字幕后打开对应的解码器:
	
```
static int read_thread(void *arg) {
	...
	/* open the streams */
	if (st_index[AVMEDIA_TYPE_AUDIO] >= 0) {
	    stream_component_open(ffp, st_index[AVMEDIA_TYPE_AUDIO]);
	} else {
	    ffp->av_sync_type = AV_SYNC_VIDEO_MASTER;
	    is->av_sync_type  = ffp->av_sync_type;
	}
	
	ret = -1;
	if (st_index[AVMEDIA_TYPE_VIDEO] >= 0) {
	    ret = stream_component_open(ffp, st_index[AVMEDIA_TYPE_VIDEO]);
	}
	if (is->show_mode == SHOW_MODE_NONE)
	    is->show_mode = ret >= 0 ? SHOW_MODE_VIDEO : SHOW_MODE_RDFT;
	
	if (st_index[AVMEDIA_TYPE_SUBTITLE] >= 0) {
	    stream_component_open(ffp, st_index[AVMEDIA_TYPE_SUBTITLE]);
	}
	...
}

```
	
```
/* open a given stream. Return 0 if OK */
static int stream_component_open(FFPlayer *ffp, int stream_index) {
	...
	switch (avctx->codec_type) {
	case AVMEDIA_TYPE_VIDEO:
	...
        if (ffp->async_init_decoder) {
            while (!is->initialized_decoder) {
                SDL_Delay(5);
            }
            if (ffp->node_vdec) {
                is->viddec.avctx = avctx;
                ret = ffpipeline_config_video_decoder(ffp->pipeline, ffp);
            }
            if (ret || !ffp->node_vdec) {
                decoder_init(&is->viddec, avctx, &is->videoq, is->continue_read_thread);
                ffp->node_vdec = ffpipeline_open_video_decoder(ffp->pipeline, ffp);
                if (!ffp->node_vdec)
                    goto fail;
            }
        } else {
            decoder_init(&is->viddec, avctx, &is->videoq, is->continue_read_thread);
            ffp->node_vdec = ffpipeline_open_video_decoder(ffp->pipeline, ffp);
            if (!ffp->node_vdec)
                goto fail;
        }
        
        decoder_start(&is->viddec, video_thread, ffp, "ff_video_dec")
        ...
    ...

}
```
	
ffpipeline_open_video_decoder 会进行解码器选择：

```
IJKFF_Pipenode *ffpipenode_create_video_decoder_from_android_mediacodec(FFPlayer *ffp, IJKFF_Pipeline *pipeline, SDL_Vout *vout){
	...
	if (!ffpipeline_select_mediacodec_l(pipeline, &opaque->mcc) || !opaque->mcc.codec_name[0]) {
        ALOGE("amc: no suitable codec\n");
        goto fail;
    }
	...
}

//最终通过这个，调用 java 层的方法去选择解码器
static bool mediacodec_select_callback(void *opaque, ijkmp_mediacodecinfo_context *mcc){
    JNIEnv *env = NULL;
    jobject weak_this = (jobject) opaque;
    const char *found_codec_name = NULL;
	...
    found_codec_name = J4AC_IjkMediaPlayer__onSelectCodec__withCString__asCBuffer(env, weak_this, mcc->mime_type, mcc->profile, mcc->level, mcc->codec_name, sizeof(mcc->codec_name));
	...
}

```

解码器的选择逻辑:

```
public static final int RANK_MAX = 1000;
public static final int RANK_TESTED = 800;
public static final int RANK_ACCEPTABLE = 700;
public static final int RANK_LAST_CHANCE = 600; // 只有大于这个评估值的解码器才会被采用
public static final int RANK_SECURE = 300;
public static final int RANK_SOFTWARE = 200;
public static final int RANK_NON_STANDARD = 100;
public static final int RANK_NO_SENSE = 0;

 public static IjkMediaCodecInfo setupCandidate(MediaCodecInfo codecInfo, String mimeType) {
 	...
	if (!name.startsWith("omx.")) {
        rank = RANK_NON_STANDARD;
    } else if (name.startsWith("omx.pv")) {
        rank = RANK_SOFTWARE;
    } else if (name.startsWith("omx.google.")) {
        rank = RANK_SOFTWARE;
    } else if (name.startsWith("omx.ffmpeg.")) {
        rank = RANK_SOFTWARE;
    } else if (name.startsWith("omx.k3.ffmpeg.")) {
        rank = RANK_SOFTWARE;
    } else if (name.startsWith("omx.avcodec.")) {
        rank = RANK_SOFTWARE;
    } else if (name.startsWith("omx.ittiam.")) {
        // unknown codec in qualcomm SoC
        rank = RANK_NO_SENSE;
    } else if (name.startsWith("omx.mtk.")) {
        // 1. MTK only works on 4.3 and above
        // 2. MTK works on MIUI 6 (4.2.1)
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.JELLY_BEAN_MR2)
            rank = RANK_NO_SENSE;
        else
            rank = RANK_TESTED;
    } else {
        Integer knownRank = getKnownCodecList().get(name);
        if (knownRank != null) {
            rank = knownRank;
        } else {
            try {
                CodecCapabilities cap = codecInfo
                        .getCapabilitiesForType(mimeType);
                if (cap != null)
                    rank = RANK_ACCEPTABLE;
                else
                    rank = RANK_LAST_CHANCE;
            } catch (Throwable e) {
                rank = RANK_LAST_CHANCE;
            }
        }
    }
    ...  
}
```
	
	
	
	
	
	
	
	
	
	
	
	
	
	