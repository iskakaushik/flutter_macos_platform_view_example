import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_macos_platform_view_example/flutter_macos_platform_view_example.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_macos_platform_view_example');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterMacosPlatformViewExample.platformVersion, '42');
  });
}
