### Android HIDL

1. 定义 .hal 接口
		
		/hardware/interfaces/sensors/1.0/ISensors.hal
		
		package android.hardware.sensors@1.0;
		interface ISensors {
			...
		}
		
2. 实现接口：

		/hardware/interfaces/sensors/1.0/default/Sensors.cpp
		
		#include <android/hardware/sensors/1.0/ISensors.h>
		namespace android {
		namespace hardware {
		namespace sensors {
		namespace V1_0 {
		namespace implementation {
		
			struct Sensors : public ::android::hardware::sensors::V1_0::ISensors{
				...//通过 hw_get_module 打开对应的 hal 设备
			}
			
		}}}}}
		
		
3. 使用接口：

		/frameworks/native/service/sensorservice/SensorDevice.cpp

		#include "android/hardware/sensors/1.0/ISensors.h"
		using namespace android::hardware::sensors::V1_0;
		using namespace android::hardware::sensors::V1_0::implementation;

		ISensors::getService();