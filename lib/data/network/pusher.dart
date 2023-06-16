import 'package:laravel_echo/laravel_echo.dart';
import 'package:pusher_client/pusher_client.dart';

class LaravelEcho {
  static LaravelEcho? _singleton;
  static late Echo _echo;
  final String token;

  LaravelEcho._({
    required this.token,
  }) {
    _echo   = createLaravelEcho(token);
  }

  factory LaravelEcho.init({
    required String token,
  }) {
    if (_singleton == null || token != _singleton?.token) {
      _singleton = LaravelEcho._(token: token);
    }

    return _singleton!;
  }

  static Echo get instance => _echo;

  static String get socketId => _echo.socketId() ?? "11111.11111111";
}
/*
app_id = "1619877"
key = "89c548f8b2ac294bf0b0"
secret = "74c08533a22c0e0e9b74"
cluster = "mt1"
 */
/*
 static const appId = "12345";
  static const key = "ABCDEFG";
  static const secret = "HIJKLMNOP";
  static const cluster = "mt1";
  static const hostEndPoint = "yaamen1.com";
  static const hostAuthEndPoint = "$hostEndPoint/api/broadcasting/auth";
  static const port = 6001;
 */
/*
 static const appId = "1619877";
  static const key = "89c548f8b2ac294bf0b0";
  static const secret = "74c08533a22c0e0e9b74";
  static const cluster = "mt1";
  static const hostEndPoint = "yaamen1.com";
  static const hostAuthEndPoint = "$hostEndPoint/api/broadcasting/auth";
  static const port = 6001;

 */
class PusherConfigration {
  static const appId = "1619877";
  static const key = "89c548f8b2ac294bf0b0";
  static const secret = "74c08533a22c0e0e9b74";
  static const cluster = "mt1";
  static const hostEndPoint = "yaamen1.com";
  static const hostAuthEndPoint = "$hostEndPoint/api/broadcasting/auth";
  static const port = 6001;
}

PusherClient createPusherClient(String token) {
  PusherOptions options = PusherOptions(
      wsPort: PusherConfigration.port,
      encrypted: true,
      host: PusherConfigration.hostEndPoint,
     // cluster: PusherConfigration.cluster,
    /*  auth: PusherAuth(PusherConfigration.hostAuthEndPoint, headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
        "Accept": "application/json"
      })

     */
  );
  PusherClient pusherClient = PusherClient(
    PusherConfigration.key,
    options,
    autoConnect: false,
    enableLogging: true,
  );

  return pusherClient;
}

Echo createLaravelEcho(String token) {

  return Echo(
    client: createPusherClient(token),
    broadcaster: EchoBroadcasterType.Pusher,
  );

}
