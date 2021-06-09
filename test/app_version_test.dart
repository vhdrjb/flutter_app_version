import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_version/app_version.dart';

void main() {
  const MethodChannel channel = MethodChannel('ir.vhdrjb.channel/app_version');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '1.0.0';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getApplicationVersion', () async {
    expect(await AppVersion.applicationVersion, '1.0.0');
  });
}
