import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/presentation/base/base_view_model.dart';

class SupervisorTripViewModel extends BaseViewModel with ChangeNotifier{
  late  PusherClient pusherClient;
  late Channel channel;
  late GoogleMapController _controller;
  late Marker _marker;
  late LatLng _center;
  double _zoom = 14.0;
  @override
  void start() async{
    AppPreferences _appPreferences=instance<AppPreferences>();
    String token=await _appPreferences.getToken();
    LaravelEcho.init(token: token);

  }
@override
  void dispose() {
    LaravelEcho.instance.disconnect();
    super.dispose();
  }

}