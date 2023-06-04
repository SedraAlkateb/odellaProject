/*
import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/map_position/view_model/location_service.dart';
import 'package:untitled/presentation/map_position/view_model/map_position_view_model.dart';
import 'package:untitled/presentation/map_position/view_model/polyline_services.dart';
import 'package:untitled/presentation/map_serves/polyline_serves.dart';
import 'package:untitled/presentation/page/home/view_model/home_view_model.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
class MapPositionView extends StatefulWidget {
  const MapPositionView({Key? key}) : super(key: key);
  @override
  _MapPositionViewState createState() => _MapPositionViewState();
}

class _MapPositionViewState extends State<MapPositionView> {
  var mapPolyLineWatch;
  var mapPolyLineRead;
  @override
  void initState() {
      getRoute();

    super.initState();
  }
  @override
  void didChangeDependencies() {
    mapPolyLineWatch  = context.watch<MapPositionViewModel>();
    mapPolyLineRead = context.read<MapPositionViewModel>();
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    super.dispose();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
        key: _scaffoldKey,
        body:contentWidget()
    )
    ;
  }
  Widget contentWidget(){
      return   Column(
        children: [
          Expanded(child: getMap()),
          screenWidget()
        ],
      );

  }
  Widget screenWidget(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p16,horizontal: AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Provider.of<HomeViewModel>(context,listen: false).getLine().name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:Theme.of(context).textTheme.labelLarge,
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppPadding.p8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p8),
                    child: Icon(Icons.circle_sharp,color: ColorManager.icon,size: AppSize.s18,),
                  ),
                  Text(
                    Provider.of<HomeViewModel>(context,listen: false).getLine().from?.name ??"",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppPadding.p12),
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: double.infinity,
                    height: AppSize.s1_5,
                    // color: Color,
                  ),
                  itemCount:Provider.of<HomeViewModel>(context,listen: false).getPosition().length,
                  itemBuilder: (context, index) =>index+1==Provider.of<HomeViewModel>(context,listen: false).getPosition().length?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.gps_not_fixed,size: AppSize.s18,color: ColorManager.grey,),
                          Padding(
                            padding: const EdgeInsets.only(left: AppPadding.p8),
                            child: Text(
                              Provider.of<HomeViewModel>(context,listen: false).getPosition()[index].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),

                        ],
                      ),
                    ],
                  )
                      :Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.gps_not_fixed,size: AppSize.s18,color: ColorManager.grey,),
                          Padding(
                            padding: const EdgeInsets.only(left: AppPadding.p8),
                            child: Text(
                              Provider.of<HomeViewModel>(context,listen: false).getPosition()[index].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,

                              style:Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),

                        ],
                      ),
                      Icon(Icons.keyboard_arrow_down_sharp,size: AppSize.s18,color: ColorManager.grey,),
                      Icon(Icons.keyboard_arrow_down_sharp,size: AppSize.s18,color: ColorManager.grey)
                    ],
                  )

              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p8),
                    child: Icon(Icons.circle_sharp,color: ColorManager.icon,size: AppSize.s18,),
                  ),
                  Text(
                    Provider.of<HomeViewModel>(context).getLine().to?.name ??"",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<Widget> _loadMap() async {
    // Load map here
    return Column(
      children: [
        Expanded(child: getMap()),
        screenWidget()
      ],
    );
  }

  Widget getMap() {
       return Scaffold(
        body: GoogleMap(
          initialCameraPosition: mapPolyLineWatch.getInitCameraPosition(),
          mapType: MapType.normal,
          onMapCreated: (controller)  {
            mapPolyLineWatch.setController(mapPolyLineWatch.getController().complete(controller));
          },
          onCameraMove: (e){
            mapPolyLineWatch.setCurrentLoc(e.target);
          },
          markers: mapPolyLineWatch.getMarkers(),
          polylines: mapPolyLineWatch.getPolyLines(),
        ),
        floatingActionButton:
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => mapPolyLineRead.drawPolyline(
                  LatLng(38.52900208591146, -98.54919254779816), mapPolyLineWatch.currentLocation),
              child: Icon(Icons.settings_ethernet_rounded),
            ),
            FloatingActionButton(
              onPressed: () => mapPolyLineRead.setMarker(mapPolyLineWatch.currentLocation),
              child: Icon(Icons.location_on),
            ),
            FloatingActionButton(
              onPressed: () =>mapPolyLineRead.getMyLocation(),
              child: Icon(Icons.gps_fixed),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 20,
          alignment: Alignment.center,
          child: Text(
              "lat: ${mapPolyLineRead.currentLocation.latitude}, long: ${mapPolyLineWatch.currentLocation.longitude}"),
        ),
      );


  }
  getRoute() async {
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

    // التحقق من عدم وجود خطأ
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      errorMessage = 'لا يمكن العثور على الخط';
    }
  }
}






/*
  Future<void> _showSearchDialog() async {
    var p = await PlacesAutocomplete.show(
        context: context,
        apiKey: Constants.apiKey,
        mode: Mode.fullscreen,
        language: "ar",
        region: "ar",
        offset: 0,
        hint: "Type here...",
        radius: 1000,
        types: [],
        strictbounds: false,
        components: [Component(Component.country, "ar")]);
    _getLocationFromPlaceId(p!.placeId!);
  }

  Future<void> _getLocationFromPlaceId(String placeId) async {
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: Constants.apiKey,
      apiHeaders: await GoogleApiHeaders().getHeaders(),
    );

    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(placeId);

    _animateCamera(LatLng(detail.result.geometry!.location.lat,
        detail.result.geometry!.location.lng));
  }
  FutureBuilder(

        future: _loadMap() ,
        builder:(BuildContext context,AsyncSnapshot<Widget> snapshot){
          if (snapshot.hasData) {
            return snapshot.data!;
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },

      );
  */
 */