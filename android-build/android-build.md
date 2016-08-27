### . build/envsetup.sh

`source envsetup.sh` 之后：

1. `envsetup.sh` 里面的方法就可以在命令行使用了，比如 `lunch`
2. source 的时候，会查找 `device` `vendor` `product` 目录下的 `vendorsetup.sh`, 也一起source 进来。 他们会调用 `add_lunch_combo` 把自己的编译项目加进来；
3. 

### lunch

列出所有支持的编译项目，用户选择后， 根据选择的项目，设置好环境变量，这些环境变量在后面`make`的时候会用到。比如几个重要的：
`TARGET_PRODUCT` `TARGET_BUILD_VARIANT` `TARGET_ARCH` `JAVA_HOME`

```
function lunch()
{
	...
	product=${selection%%-*} # Trim everything after first dash
	variant_and_version=${selection#*-} # Trim everything up to first dash
	...
	export TARGET_PRODUCT=$(get_build_var TARGET_PRODUCT)
	export TARGET_BUILD_VARIANT=$(get_build_var TARGET_BUILD_VARIANT)

	...
	#设置其他环境变量
	set_stuff_for_environment
	...

}
```
`set_stuff_for_environment` 这里面会调用几个关键的函数：

* `set_java_home` 设置 java 编译环境；
* `setpaths` 把编译工具链的路径添加到 `PATH` 环境变量；这里的工具链在 `prebuilts/gcc/` 下面；
