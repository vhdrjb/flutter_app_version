
import 'dart:async';

import 'package:flutter/services.dart';

class AppVersion {
  static const MethodChannel _channel =
      const MethodChannel('ir.vhdrjb.channel/app_version');

  static Future<String?> get applicationVersion async {
    final String? version = await _channel.invokeMethod('getApplicationVersion');
    return version;
  }
}
