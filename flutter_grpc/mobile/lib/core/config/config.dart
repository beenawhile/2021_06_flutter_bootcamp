import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:safe_device/safe_device.dart';

class Config {
  static Future<String> get host async {
    // REF: currently using only emulator
    if (kIsWeb || !(await SafeDevice.isRealDevice)) {
      return simulatorHost;
    }
    return deviceHost;
  }

  static const deviceHost = '2.tcp.ngrok.io';
  static const simulatorHost = '127.0.0.1';

  static Future<int> get port async {
    if (kIsWeb || !(await SafeDevice.isRealDevice)) {
      return simulatorPort;
    }
    return devicePort;
  }

  static final devicePort = kIsWeb ? 8080 : 19028;
  static final simulatorPort = kIsWeb ? 8080 : 50051;
}
