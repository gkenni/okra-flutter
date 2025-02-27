import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class Helper {
  static Future<String> getDeviceUUID() async {
    String identifier = "";
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        print("this is the id ${build.id}");
        identifier = build.id; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } catch (ex) {}
    return identifier;
  }

  static Future<AndroidDeviceInfo> getAndroidInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        return await deviceInfoPlugin.androidInfo;
      }
    } catch (ex) {
      return null;
    }
  }

  static Future<IosDeviceInfo> getIosInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isIOS) {
        return await deviceInfoPlugin.iosInfo;
      }
    } catch (ex) {
      return null;
    }
  }
}
