import 'package:flutter_test/flutter_test.dart';
import 'package:bulb_plugin/bulb_plugin_platform_interface.dart';
import 'package:bulb_plugin/bulb_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBulbPluginPlatform
    with MockPlatformInterfaceMixin
    implements BulbPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BulbPluginPlatform initialPlatform = BulbPluginPlatform.instance;

  test('$MethodChannelBulbPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBulbPlugin>());
  });

  test('getPlatformVersion', () async {

  });
}
