import 'dart:io';
import 'package:gyver_hub/env.dart';

class Helpers {
  static Future<bool> checkInternetConnection() async {
    String host = Env.versionUrl
        .replaceAll('https://', '')
        .replaceAll('http://', '')
        .split('/')
        .first;

    if (host.contains(':')) host = host.split(':').first;

    try {
      final result = await InternetAddress.lookup(host);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } catch (_) {}
    return false;
  }
}
