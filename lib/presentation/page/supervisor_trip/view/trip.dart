import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late  PusherClient pusherClient;
  late Channel channel;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late GoogleMapController _controller;
 late
 Marker _marker;
 late LatLng _center;
  double _zoom = 14.0;

  @override
  void initState() {
    super.initState();
    PusherOptions options = PusherOptions(
      cluster:  PusherConfigration.cluster,
    );
    pusherClient = PusherClient(
      PusherConfigration.key,
      options,
      autoConnect:true,
      enableLogging: true,

    );
    pusherClient.connect();
    pusherClient.onConnectionStateChange((state) {
      print("previousState: ${state?.previousState??""}, currentState: ${state?.currentState}");
    });
    pusherClient.onConnectionError((error) {
      print("error: ${error?.message}");
    });
    channel = pusherClient.subscribe("tracking.1");
    channel.trigger("tracking", {"longitude":"3333","latitude":"333333333"});
// Bind to listen for events called "order-status-updated" sent to "private-orders" channel

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Live Location Tracking'),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(40.712776, -74.005974),
            zoom: _zoom,
          ),
       ///   markers: Set.of((_marker != null) ? [_marker] : []),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    setState(() {
      _center = LatLng(40.712776, -74.005974);
      _zoom = 14.0;
    });
  }

  @override
  void dispose() {
   // channel.
    super.dispose();
  }
}
