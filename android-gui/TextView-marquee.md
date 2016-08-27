+ 问题： 使用 `TextView` 的marquee（跑马灯）效果时，跑马灯经常不自动开始跑；
+ 使用方式：
	* Activity 有2种UI形态，分别为2个页面A/B，通过 `setContentView` 来切换，包含跑马灯的 `TextView` 就是在其中一个UI中，假设为A；
	* 一开始显示的是 B 页面，但A页面中的 `Marquee` 会先设置好，然后当从 B 切换到 A 时 跑马灯却不会自动开始跑；
	* 如果一开始显示 A 然后切换回 B 接着再切换回A， 跑马灯也会停止；

+ 跑马灯的启动条件：

	```
	private boolean canMarquee() {
		int width = mRight - mLeft - getCompoundPaddingLeft() - getCompoundPaddingRight();
		return width > 0 && (mLayout.getLineWidth(0) > width
                || (mMarqueeFadeMode != MARQUEE_FADE_NORMAL && mSavedMarqueeModeLayout != null
                        && mSavedMarqueeModeLayout.getLineWidth(0) > width));
    }
	private void startMarquee() {
		...
		if ((mMarquee == null || mMarquee.isStopped()) 
				&& (isFocused() || isSelected())
				&& getLineCount() == 1 
				&& canMarquee()) {
		    ...
		    mMarquee.start(mMarqueeRepeatLimit);
		}
	}
	```
	我们的场景下， 原因是 mRight/mLeft 没有正常初始化，导致marquee 不启动。 而 这2个值的初始化应该是在 layout 阶段赋值的，正确的调用堆栈应该像下面这样：

	```
	 at android.view.View.setFrame(View.java:19727)
	 at android.widget.TextView.setFrame(TextView.java:6132)
	 at android.view.View.layout(View.java:19658)
	 at android.widget.RelativeLayout.onLayout(RelativeLayout.java:1083)
	 at android.view.View.layout(View.java:19661)
	 at android.view.ViewGroup.layout(ViewGroup.java:6075)
	 at android.widget.FrameLayout.layoutChildren(FrameLayout.java:323)
	 at android.widget.FrameLayout.onLayout(FrameLayout.java:261)
	 at android.view.View.layout(View.java:19661)
	 at android.view.ViewGroup.layout(ViewGroup.java:6075)
	 at android.widget.LinearLayout.setChildFrame(LinearLayout.java:1791)
	 at android.widget.LinearLayout.layoutVertical(LinearLayout.java:1635)
	 at android.widget.LinearLayout.onLayout(LinearLayout.java:1544)
	 at android.view.View.layout(View.java:19661)
	 at android.view.ViewGroup.layout(ViewGroup.java:6075)
	 at android.widget.FrameLayout.layoutChildren(FrameLayout.java:323)
	 at android.widget.FrameLayout.onLayout(FrameLayout.java:261)
	 at com.android.internal.policy.DecorView.onLayout(DecorView.java:761)
	 at android.view.View.layout(View.java:19661)
	 at android.view.ViewGroup.layout(ViewGroup.java:6075)
	 at android.view.ViewRootImpl.performLayout(ViewRootImpl.java:2496)
	 at android.view.ViewRootImpl.performTraversals(ViewRootImpl.java:2212)
	 at android.view.ViewRootImpl.doTraversal(ViewRootImpl.java:1392)
	 at android.view.ViewRootImpl$TraversalRunnable.run(ViewRootImpl.java:6752)
	 at android.view.Choreographer$CallbackRecord.run(Choreographer.java:911)
	 at android.view.Choreographer.doCallbacks(Choreographer.java:723)
	 at android.view.Choreographer.doFrame(Choreographer.java:658)
	 at android.view.Choreographer$FrameDisplayEventReceiver.run(Choreographer.java:897)
	 at android.os.Handler.handleCallback(Handler.java:790)
	 at android.os.Handler.dispatchMessage(Handler.java:99)
	 at android.os.Looper.loop(Looper.java:164)
	 at android.app.ActivityThread.main(ActivityThread.java:6510)
	 at java.lang.reflect.Method.invoke(Native Method)
	```