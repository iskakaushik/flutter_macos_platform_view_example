
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterMacosPlatformViewExample {
  static const MethodChannel _channel = MethodChannel('flutter_macos_platform_view_example');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
