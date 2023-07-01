/*
import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/data/network/pusher.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Background Fetch Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    retrieveCounter();
  }
  late  PusherClient pusherClient;
  late Channel channel;
  PusherTrip _pusherTrip=instance<PusherTrip>();

  Future<void> retrieveCounter() async {
    pusherClient= await  _pusherTrip.createPusherClient();
    channel = pusherClient.subscribe("private-tracking.${1}");
    await BackgroundLocation.startLocationService();
    BackgroundLocation.getLocationUpdates((location) {
      print(location.latitude);
      print(location.longitude);
      // إرسال التحديثات المستمرة لموقع المستخدم إلى خادم Pusher
      channel.trigger('my-event', {'latitude': location.latitude, 'longitude': location.longitude});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Background Fetch Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class BackgroundService extends FlutterBackgroundService {
  static BackgroundService? _instance;

  factory BackgroundService() => _instance ??= BackgroundService._();
  BackgroundService._();
  static Future<void> start() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterBackgroundService.initialize(onStart);
    FlutterBackgroundService().startService();
  }

  loc.Location location = loc.Location();

  static Future<void> onStart() async {

  }
  late PusherClient pusherClient;
  late Channel channel;
  PusherTrip _pusherTrip = instance<PusherTrip>();

  void stopTracking() {
    if (_locationSubscription != null) {
      _trackingLocation = false;
      _locationSubscription?.cancel();
      //  _locationSubscription.pause();
    }
    cancelTrip();
  }

  cancelTrip() {
    channel.cancelEventChannelStream();
    pusherClient.disconnect();
  }
  late StreamSubscription<loc.LocationData>? _locationSubscription=null;
  loc.LocationData? _locationData;

  Future<void> _setupLocationStream(int tripId) async {
    //_locationData = await LocationService().getLocation();
    try {
      pusherClient = await _pusherTrip.createPusherClient();
      channel = pusherClient.subscribe("private-tracking.${tripId}");
      _locationSubscription ??= location.onLocationChanged.listen((
          loc.LocationData newLocationData) async {
        if (newLocationData.longitude != null &&
            newLocationData.latitude != null) {
          print(newLocationData.longitude);
          Map<String, double> eventData = {
            'lng': newLocationData.longitude ?? 0.0,
            'lat': newLocationData.latitude ?? 0.0
          };

          channel.trigger("tracking", eventData);
          //newLocationData.longitude ///newLocationData.latitude
        } //client-tracking
        setLocation(newLocationData, null);
      });
    } on Exception catch (e) {
      print(e);
      print("_scaffoldKey.currentState?.showSnackBar("
          " SnackBar(content: Text('Error refreshing location!')));");
      setLocation(null, e.toString());
    }
  }
  String? _error;
  bool _trackingLocation = false;

  setLocation(loc.LocationData? newLocationData, String? error){
    _locationData = newLocationData;
    _error = error;
    _trackingLocation=true;
  }
}*/
 */