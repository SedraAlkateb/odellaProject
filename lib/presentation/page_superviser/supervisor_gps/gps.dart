import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/presentation/map_position/view_model/location_service.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:pusher_client/pusher_client.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  late  PusherClient pusherClient2;
  late Channel channel2;

  @override
  void initState() {
    PusherClient pusherClient2;
    Channel channel2;
    PusherOptions options = PusherOptions(
      // host: "yaamen1.com",
      //   wsPort: 6001,
      //wssPort: 6001,
      // encrypted: false,
      cluster:  PusherConfigration.cluster,
    );
    pusherClient2 = PusherClient(
      PusherConfigration.key,
      options,
      autoConnect:true,
      enableLogging: true,

    );
    pusherClient2.connect();
    pusherClient2.onConnectionStateChange((state) {
      print("previousState: ${state?.previousState??""}, currentState: ${state?.currentState}");
    });
    print(pusherClient2.getSocketId());
    print("pusherClient.getSocketId( )");

    pusherClient2.onConnectionError((error) {
      print("error: ${error?.message} ${error?.code}${error?.exception}");
    });
    channel2 = pusherClient2.subscribe("tracking.1");
    //   channel = pusherClient.subscribe("name_channel");


// Bind to listen for events called "order-status-updated" sent to "private-orders" channel


// Unsubscribe from channel
    // pusherClient.unsubscribe("tracking.1");
/*
   if (channel2 != null) {
      channel2.trigger("tracking.1", {"longitude":"3333","latitude":"333333333"});
    }
 */
// Disconnect from pusher service
    //pusherClient.disconnect();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
        body: Center(
            child: TextButton(onPressed: () async {
              //    final state = await pusherClient.onConnectionStateChange.asStream().first;
              //  print("State changed to ${state.currentState}");
            },
              child: Text("Test"),
            ))
    )

    );

  }
}


/*
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
 late IO.Socket socket;
  @override
  void initState() {
    socket = IO.io('wss://yaamen1.com:6001', <String, dynamic>{
      'transports': ['websocket'],
      'query': 'key=ABCDEFG&secret=HIJKLMNOP&id=12345&cluster=mt1',
    });
    socket.connect();
    socket.on('connect', (_) {
      print('Connected to server');
      print('Server URL: ${socket.io.uri}');

    });
    if (socket.connected) {
      print('Connected to server');
      print('Server URL: ${socket.io.uri}');
    }else{
      print("null");
    }
    super.initState();
  }

  @override
  void dispose() {
socket.onDisconnect((_)=>print("dffs"));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: Center(
        child: TextButton(onPressed: (){

        }, child: Text("fdsf")),
      )
    )

    );

  }
}


class Sedra extends StatelessWidget {
  const Sedra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("dfds"),
    );
  }
}*/

/*
import 'package:pusher_client/pusher_client.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pusher.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pusher Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pusher Demo'),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }

}*/
/*
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
void main() => runApp(MyApp());



class _MyAppState extends State<MyApp> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final WebSocketChannel channel = IOWebSocketChannel.connect(
      'wss://yaamen1.com');
  LocationData? _locationData;

  String? _error;
int tripId=0;
  @override
  void initState() {
    super.initState();
    _setupLocationStream();
  }

  @override
  Widget build(BuildContext context) {
//    _locationData = _getMyLocation();
    return MaterialApp(
      home: Scaffold(

      key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Live Location Tracking'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _locationData != null
                  ? Text(
                  'Lat: ${_locationData?.latitude}, Long: ${_locationData?.longitude}')
                  : _error != null
                  ? Text('Error: $_error')
                  : CircularProgressIndicator(),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_locationData != null) {
                    _sendLocation(_locationData?.latitude??0.0, _locationData?.longitude??0.0,tripId);
                  }
                },
                child: Text('Send My Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<LocationData> _getMyLocation() async {
    LocationData  _myLocation = await LocationService().getLocation();
    print(_myLocation.altitude);

    return _myLocation;
  }


  Future<void> _setupLocationStream() async {
    final location = Location();
    try {
      await location.changeSettings();
      location.onLocationChanged.listen((LocationData newLocationData) {
        setState(() {
          _locationData = newLocationData;
          _error = null;
        });
      });
    }on Exception catch (e) {
      print(e);
      print("_scaffoldKey.currentState?.showSnackBar("
         " SnackBar(content: Text('Error refreshing location!')));");

      setState(() {
        _locationData = null;
        _error = e.toString();
      });
    }
  }

  void _sendLocation(double latitude, double longitude,int tripId) {
    final jsonString =
        '{"latitude": $latitude, "longitude": $longitude,"tripId": $tripId}';
    channel.sink.add(jsonString);
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
*/
/*
on LocationPermissionException catch (e) {
      if (e is LocationPermissionDeniedException) {
        _scaffoldKey.currentState?.showSnackBar(
            SnackBar(content: Text('Location permission denied. Please enable it!'))
        );
      }
    }
 */