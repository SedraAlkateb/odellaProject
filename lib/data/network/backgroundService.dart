import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    // Load the saved counter value
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter++;
      prefs.setInt('counter', counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
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