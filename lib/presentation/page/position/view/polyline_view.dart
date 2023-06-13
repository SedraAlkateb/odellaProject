import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/map/poltline_map_view.dart';
import 'package:untitled/presentation/page/home/view_model/home_view_model.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
class PolyLineView extends StatefulWidget {
  @override
  State<PolyLineView> createState() => _PolyLineViewState();
}

class _PolyLineViewState extends State<PolyLineView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:  Stack(
  children: [
    Column(
      children: [
        Expanded(
          child: PolylineMapView(position: Provider.of<HomeViewModel>(context).getPosition())

        ),
        // SingleChildScrollView(
        //   child: Padding(
        //     padding:  EdgeInsets.symmetric(vertical: AppPadding.p16,horizontal: AppPadding.p16),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           "provider.getLine().name",
        //           maxLines: 2,
        //           overflow: TextOverflow.ellipsis,
        //           style:Theme.of(context).textTheme.labelLarge,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(top: AppPadding.p8),
        //           child: Row(
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(right: AppPadding.p8),
        //                 child: Icon(Icons.circle_sharp,color: ColorManager.icon,size: AppSize.s18,),
        //               ),
        //               Text(
        //                 "provider.getLine().from?.name ??""",
        //                 maxLines: 2,
        //                 overflow: TextOverflow.ellipsis,
        //                 style:Theme.of(context).textTheme.titleMedium,
        //               ),
        //             ],
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(left: AppPadding.p12),
        //           child: ListView.separated(
        //               shrinkWrap: true,
        //               scrollDirection: Axis.vertical,
        //               separatorBuilder: (context, index) => const SizedBox(
        //                 width: double.infinity,
        //                 height: AppSize.s1_5,
        //                 // color: Color,
        //               ),
        //               itemCount:3,
        //               //provider.getPosition().length,
        //               itemBuilder: (context, index) =>index+1==3?
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 children: [
        //                   Row(
        //                     children: [
        //                       Icon(Icons.gps_not_fixed,size: AppSize.s18,color: ColorManager.grey,),
        //                       Padding(
        //                         padding: const EdgeInsets.only(left: AppPadding.p8),
        //                         child: Text(
        //                           "provider.getPosition()[index].name",
        //                           maxLines: 1,
        //                           overflow: TextOverflow.ellipsis,
        //                           style:Theme.of(context).textTheme.headlineMedium,
        //                         ),
        //                       ),
        //
        //                     ],
        //                   ),
        //                 ],
        //               )
        //                   :Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 children: [
        //                   Row(
        //                     children: [
        //                       Icon(Icons.gps_not_fixed,size: AppSize.s18,color: ColorManager.grey,),
        //                       Padding(
        //                         padding: const EdgeInsets.only(left: AppPadding.p8),
        //                         child: Text(
        //                          " provider.getPosition()[index].name",
        //                           maxLines: 1,
        //                           overflow: TextOverflow.ellipsis,
        //
        //                           style:Theme.of(context).textTheme.headlineMedium,
        //                         ),
        //                       ),
        //
        //                     ],
        //                   ),
        //                   Icon(Icons.keyboard_arrow_down_sharp,size: AppSize.s18,color: ColorManager.grey,),
        //                   Icon(Icons.keyboard_arrow_down_sharp,size: AppSize.s18,color: ColorManager.grey)
        //                 ],
        //               )
        //
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
        //           child: Row(
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(right: AppPadding.p8),
        //                 child: Icon(Icons.circle_sharp,color: ColorManager.icon,size: AppSize.s18,),
        //               ),
        //               Text(
        //                " Provider.of<HomeViewModel>(context).getLine().to?.name ??""",
        //                 maxLines: 2,
        //                 overflow: TextOverflow.ellipsis,
        //                 style:Theme.of(context).textTheme.titleMedium,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    ),

    DraggableScrollableSheet(
      maxChildSize: 0.6,
      builder : (context,controller)=>
          Container(
            color: Colors.white,
            child:ListView.builder(controller: controller,
              itemCount:1,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: AppPadding.p16,horizontal: AppPadding.p16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Provider.of<HomeViewModel>(context).getLine().name,
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
                              Provider.of<HomeViewModel>(context).getLine().from?.name ??"",
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
                            itemCount:
                            Provider.of<HomeViewModel>(context).getPosition().length,
                            itemBuilder: (context, index) =>index+1==3?
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
                                         Provider.of<HomeViewModel>(context).getPosition()[index].name,
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
                                        Provider.of<HomeViewModel>(context).getPosition()[index].name,
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
                );
                //ListTile(title: Text("position"),);
              },
            ) ,
          ),
    ),
  ],

),
    );
  }


}

/*
 Padding(
      padding:  EdgeInsets.all(AppPadding.p12),
      child: IconButton(
        onPressed: () {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamed(context,Routes.pageScreen);
          });
        },
        icon:
        SvgPicture.asset(
            ImageAssets.vector,
            semanticsLabel: 'Acme Logo'
        ),

      ),
    ),
 late GoogleMapController mapController;
  List<LatLng> points = [];
PolylineMapView(position: Provider.of<HomeViewModel>(context).getPosition())
  GoogleMap(
        onMapCreated: _onMapCreated,
        polylines: {
          Polyline(
            polylineId: PolylineId('route'),
            points: points,
            color: Colors.blue,
            width: 5,
          ),
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194),
          zoom: 12,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPoint,
        child: Icon(Icons.add),
      ),
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _addPoint() {
    LatLng point = LatLng(37.7749, -122.4194);
    setState(() {
      points.add(point);
    });
  }
 */