import 'dart:async';

// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class AppVersionWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'ir.vhdrjb.channel/app_version',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = AppVersionWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getApplicationVersion':
        return getPlatformVersion();
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'app_version for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  Future<String> getPlatformVersion() {
    return Future.value('1.0.0');
  }
}
