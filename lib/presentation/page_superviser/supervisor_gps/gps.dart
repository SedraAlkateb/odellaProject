import 'dart:convert';

import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
final _channel = IOWebSocketChannel.connect(

      'wss://yaamen1.com:6001/ABCDEFG',
  headers: {
    'Origin': 'http://localhost:8080',
  },
);

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _channel.sink.add(json.encode({
      "event": "tracking",
      "data": {"channel": "tracking.2"}
    }));


    _channel.stream.listen((message) {
      print('Received message: $message');
    }, onError: (error) {
      if (error.osError?.errorCode == 7) {
        print('WebSocket closed by server');
      } else if (error.osError?.errorCode == 22) {
        print('WebSocket connection refused');
      } else if (error.osError?.errorCode == 61) {
        print('WebSocket connection refused (OS error: $error)');
      } else {
        print('Socket error => $error');
      }
    }, onDone: () {
      print('Socket: done');
    });
    super.initState();
  }

  @override
  void dispose() {
    _channel.sink.close();
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


