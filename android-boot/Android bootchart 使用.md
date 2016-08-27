### Android bootchart 使用


使用 android bootchart 可以收集 android系统从 init 进程开始到 boot_complete 的时间消耗，以及这段时间内CPU/IO 的消耗。 如何使用这里有说明： https://source.android.com/devices/tech/perf/boot-times


但收集到的数据用 bootchart 来解析时遇到几个问题：

1. 报错：

	```
	Traceback (most recent call last):
  File "/usr/bin/bootchart", line 23, in <module>
    sys.exit(main())
  File "/usr/lib/python2.7/dist-packages/pybootchartgui/main.py", line 137, in main
    render()
  File "/usr/lib/python2.7/dist-packages/pybootchartgui/main.py", line 128, in render
    batch.render(writer, res, options, filename)
  File "/usr/lib/python2.7/dist-packages/pybootchartgui/batch.py", line 39, in render
    surface = make_surface(w,h)
  File "/usr/lib/python2.7/dist-packages/pybootchartgui/batch.py", line 22, in <lambda>
    "png": (lambda w,h: cairo.ImageSurface(cairo.FORMAT_ARGB32,w,h), lambda sfc: sfc.write_to_png(filename)),
cairo.Error: invalid value (typically too big) for the size of the input (surface, pattern, etc.)

	```

	这是因为进程树的开始时间计算错误：

	```
	/usr/lib/python2.7/dist-packages/pybootchartgui/process_tree.py
	
	def get_start_time(self, process_subtree):
        """Returns the start time of the process subtree.  This is the start
	   time of the earliest process.

        """
        if not process_subtree:
            return 100000000; //这个值要比当前进程树中所有的启动时间都大，这样下面的min才能取到当前进程树中的开始时间。因此把这个值再加2个0就好了
        return min( [min(proc.start_time, self.get_start_time(proc.child_list)) for proc in process_subtree] )
        
    ```
    
    
2. 磁盘使用情况数据解析失败：

	```
	Traceback (most recent call last):
  File "/usr/bin/bootchart", line 23, in <module>
    sys.exit(main())
  File "/usr/lib/python2.7/dist-packages/pybootchartgui/main.py", line 137, in main
    render()
  File "/usr/lib/python2.7/dist-packages/pybootchartgui/main.py", line 128, in render
    batch.render(writer, res, options, filename)
  File "/usr/lib/python2.7/dist-packages/pybootchartgui/batch.py", line 41, in render
    draw.render(ctx, options, *res)
  File "/usr/lib/python2.7/dist-packages/pybootchartgui/draw.py", line 282, in render
    draw_chart(ctx, IO_COLOR, True, chart_rect, [(sample.time, sample.util) for sample in disk_stats], proc_tree)
  File "/usr/lib/python2.7/dist-packages/pybootchartgui/draw.py", line 201, in draw_chart
    yscale = float(chart_bounds[3]) / max(y for (x,y) in data)
ZeroDivisionError: float division by zero

	```
	
	原因是解析磁盘数据时，bootchart 默认的 /proc/diskstats 格式数据是14列的， 而我这边的环境是18行，所以解析失败，进而导致后面的除数为0 的错误， 把这里改成真实数据的列数就好了：
	
	
	```
	/usr/lib/python2.7/dist-packages/pybootchartgui/parsing.py
	
	def _parse_proc_disk_stat_log(file, numCpu):
	...
		def is_relevant_line(linetokens):
			return len(linetokens) == 14 and re.match(DISK_REGEX, linetokens[2])
			
	...
		
	```