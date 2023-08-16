import 'package:laravel_echo/laravel_echo.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/app/app_preferences.dart';
class PusherTrip{
  final AppPreferences _appPreferences;
  PusherTrip(this._appPreferences);
  Future<PusherClient> createPusherDailyReservation()
  async  {
    PusherOptions options = PusherOptions(
    //  host: PusherConfigration.hostEndPoint,
     // wsPort: PusherConfigration.port,
      cluster:  "mt1",
    );
    PusherClient pusherClient = PusherClient(
      "73533acae2e494dbe929",
      options,
      //   autoConnect:true,
      enableLogging: true,
    );
    pusherClient.connect();
    pusherClient.onConnectionStateChange((state) {
      print("previousState: ${state?.previousState??""}, currentState: ${state?.currentState}");
    });
    pusherClient.onConnectionError((error) {
      print("error: ${error?.message} ${error?.code}${error?.exception}");
    });
    return pusherClient;
  }
  Future<PusherClient> createPusherClient()
  async  {
    String  token= await _appPreferences.getToken();
    PusherOptions options = PusherOptions(
      host: PusherConfigration.hostEndPoint,
      auth: PusherAuth(PusherConfigration.hostAuthEndPoint
        , headers: {
          "Authorization": "Bearer $token",
          //    "Content-Type": "multipart/form-data; boundary=<calculated when request is sent>",
          //    "Accept-Encoding":"gzip, deflate, br",
          "Accept": "*/*"
        },

      ),
      wsPort: PusherConfigration.port,
      cluster:  PusherConfigration.cluster,
    );
    PusherClient pusherClient = PusherClient(
      PusherConfigration.key,
      options,

      //   autoConnect:true,
      enableLogging: true,

    );
    pusherClient.connect();
    pusherClient.onConnectionStateChange((state) {
      print("previousState: ${state?.previousState??""}, currentState: ${state?.currentState}");
    });
    pusherClient.onConnectionError((error) {
      print("error: ${error?.message} ${error?.code}${error?.exception}");
    });
    return pusherClient;
  }
}

class ChannelTrip{

}
class LaravelEcho {
  static LaravelEcho? _singleton;
  static late Echo _echo;
  final String token;

  LaravelEcho._({
    required this.token,
  }) {
    // _echo   = createLaravelEcho(token);
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
  static const hostEndPoint = "https://yaamen1.com";
  static const hostAuthEndPoint = "$hostEndPoint/broadcasting/auth";
  static const port = 6001;
}


Channel reciveEvent(PusherClient pusherClient,Function f, int id){
  Channel channel = pusherClient.subscribe("private-tracking.${id}");
  channel.bind("tracking", (PusherEvent? event) =>f);
  return channel;
}
/*
Echo createLaravelEcho(String token) {

  return Echo(
    client: createPusherClient(token),
    broadcaster: EchoBroadcasterType.Pusher,
  );

}
 */