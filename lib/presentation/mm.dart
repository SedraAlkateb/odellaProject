import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// تعريف متغير لحفظ الخريطة
late GoogleMapController mapController;

// تعريف متغير لحفظ الموقع
LatLng _center = const LatLng(45.521563, -122.677433);

// إنشاء مثيل من Set<Marker>
Set<Marker> _markers = {};

// إنشاء مثيل من Set<Polyline>
Set<Polyline> _polylines = {};

// إنشاء مثيل من PolylinePoints
PolylinePoints polylinePoints = PolylinePoints();

// الحصول على الخط بين المواقع


// إنشاء مثيل من GoogleMap
class mmm extends StatefulWidget {
  const mmm({Key? key}) : super(key: key);

  @override
  State<mmm> createState() => _mmmState();
}

class _mmmState extends State<mmm> {
  @override
  void initState() {
    _getRoute();
    super.initState();
  }
  _getRoute() async {
    // تحديد المواقع
    LatLng sourceLocation = LatLng(40.6782, -73.9442);
    LatLng destinationLocation = LatLng(37.7749, -122.4194);
    // الحصول على الخط بين المواقع
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyBVjBKNkA_4AKXa35f1oP7P_-HZNMRq7CQ",
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destinationLocation.latitude, destinationLocation.longitude),
      travelMode: TravelMode.driving,
    );
    print("object");
setState(() {

});
    // التحقق من عدم وجود خطأ
    if (result.points.isNotEmpty) {
      List<LatLng> polylineCoordinates = [];
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      // إضافة الخط إلى _polylines
      _polylines.add(Polyline(
        polylineId: PolylineId('route'),
        visible: true,
        points: polylineCoordinates,
        color: Colors.blue,
        width: 4,
      ));
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        markers: _markers,
        polylines: _polylines,
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenPage extends StatefulWidget {
  @override
  _MapScreenPageState createState() => _MapScreenPageState();
}

class _MapScreenPageState extends State<MapScreenPage> {
  late GoogleMapController mapController;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Search',style: TextStyle(color: Colors.black),),

      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 13,
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15, top: 15),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (){
                      setState(() {
                        search();
                      });
                    },
                    iconSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void search() async {
    String query = searchController.text;

    List<Location> locations = await locationFromAddress(query);
    if (locations != null && locations.isNotEmpty) {
      Location location = locations[0];
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(location.latitude, location.longitude),
            zoom: 15,
          ),
        ),
      );
      setState(() {});
    }
  }
}

 */
