import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bulb_plugin_platform_interface.dart';

/// An implementation of [BulbPluginPlatform] that uses method channels.
class MethodChannelBulbPlugin extends BulbPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bulb_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
