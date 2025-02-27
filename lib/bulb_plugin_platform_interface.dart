import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bulb_plugin_method_channel.dart';

abstract class BulbPluginPlatform extends PlatformInterface {
  /// Constructs a BulbPluginPlatform.
  BulbPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static BulbPluginPlatform _instance = MethodChannelBulbPlugin();

  /// The default instance of [BulbPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelBulbPlugin].
  static BulbPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BulbPluginPlatform] when
  /// they register themselves.
  static set instance(BulbPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
