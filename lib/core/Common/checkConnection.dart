import 'dart:io';

class checkConeection{
  static Future<bool> isConnected() async {
  try {
    final result = await InternetAddress.lookup('example.com')
        .timeout(Duration(seconds: 3), onTimeout: () {
      return List();
    });
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else
      return false;
  } on SocketException catch (_) {
    return false;
  }
}

static void IsConnected(Function(bool) connected) async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connected(true);
    } else
      connected(false);
  } on SocketException catch (_) {
    connected(false);
  }
}

}