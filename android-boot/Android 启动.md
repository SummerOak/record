### Android 启动

```
 	
 	
```
 	
### PMS 构造函数

1. 创建 Settings 对象，初始化系统sharedUid

	```
mSettings = new Settings
mSettings.addSharedUserLPw("android.uid.log", LOG_UID, 
	ApplicationInfo.FLAG_SYSTEM, ApplicationInfo.PRIVATE_FLAG_PRIVILEGED);
```
2. 解析 etc/sysconfig 和 etc/permissions 初始化permission 和 sharedLibrary

	```
SystemConfig.getInstance()
sUserManager = new UserManagerService(context, this, 
	new UserDataPreparer(mInstaller, mInstallLock, mContext, mOnlyCore), mPackages);
systemConfig.getPermissions();
new BasePermission(perm.name, "android", BasePermission.TYPE_BUILTIN);
mSettings.mPermissions.put(perm.name, bp);
...
systemConfig.getSharedLibraries();
addSharedLibraryLPw
```

3. 解析 package.xml package.list
	
	```
mSettings.readLPw(sUserManager.getUsers(false));
```

4. 如果是首次启动，请求init 进程把优化的文件拷贝到data，并等待执行完成

	```
if (mFirstBoot) {
    requestCopyPreoptedFiles();
}
```

5. 准备解析apk时要用到的cache（// data/system/package_cache/1），并开始扫描系统路径下的apk
	
	```
preparePackageParserCache
...
scanDirTracedLI(new File(VENDOR_OVERLAY_DIR), mDefParseFlags
scanDirTracedLI(frameworkDir, mDefParseFlags
scanDirTracedLI(privilegedAppDir, mDefParseFlags
scanDirTracedLI(systemAppDir, mDefParseFlags
...
```

6. 根据上面的扫描结果，遍历系统app(package.xml 配置的）做处理:

	* 应用在 package.xml 中被disable，这是ota的场景，先把这个app之前扫描的结果剔除，然后下面会继续扫描 /data 目录下的apk（OTA 系统应用升级后会安装在data分区，之前的system分区的应用会被标记为Disable状态）;
	* package.xml 中有数据但真实apk 不存在了（上面的扫描结果中没有包含）的app；
		1) 如果是disable状态
		2）如果是enable状态, 从 package.xml 的解析结果中删除；

7. 清除未完成的安装的apk
	
	```
//Cleaning up incompletely installed app
...
//delete tmp files (/data/private-app/vmdl%d+.tmp) 这些文件怎么来的
deleteTempPackageFiles();
```

8. 清理没有用到的 sharedUid
	
	```
// Remove any shared userIDs that have no associated packages
mSettings.pruneSharedUsersLPw();
```
9. 开始扫描 data 分区下的apk
	
	```
scanDirTracedLI(mAppInstallDir, 0, scanFlags | SCAN_REQUIRE_KNOWN, 0);
scanDirTracedLI(mDrmAppPrivateInstallDir, mDefParseFlags
```

```
mStorageManagerPackage = getStorageManagerPackageName();
mSetupWizardPackage = getSetupWizardPackageName();
// Resolve protected action filters. Only the setup wizard is allowed to
// have a high priority filter for these actions.
```

```
updateAllSharedLibrariesLPw(null); //TODO
updatePermissionsLPw
```

```
reconcileAppsDataLI //TODO
```

```
//异步执行 TODO
mInstaller.fixupAppData(StorageManager.UUID_PRIVATE_INTERNAL,
                    StorageManager.FLAG_STORAGE_DE | 				StorageManager.FLAG_STORAGE_CE);
```

```
checkDefaultBrowser();
mSettings.writeLPr();
mInstallerService = new PackageInstallerService(context, this);
updateInstantAppInstallerLocked(null); //TODO
```

```
LocalServices.addService(PackageManagerInternal.class, new PackageManagerInternalImpl());
```


























