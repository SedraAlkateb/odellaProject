import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/extentions.dart';
import 'package:untitled/lang/local_keys.g.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/daily_recerviton/view_model/daily_reservation%20_viewmodel.dart';
import 'package:untitled/presentation/daily_reser_map/view_model/daily_reser_map_viewmodel.dart';
import 'package:untitled/presentation/map/poltline_map_view.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';

class PolyLineDailyView extends StatefulWidget {
  const PolyLineDailyView({super.key});

  @override
  State<PolyLineDailyView> createState() => _PolyLineDailyViewState();
}

class _PolyLineDailyViewState extends State<PolyLineDailyView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    });
    super.initState();
  }
  final _forKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController seatsNumberController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Provider.of<DailyReservationViewModel>(context).getTodayTrip()?.dataTransferPositions?.length!=0?
        Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child:
                    PolylineMapView(position: Provider.of<DailyReservationViewModel>(context).getTodayTrip()?.dataTransferPositions ??[])
                ),

              ],
            ),

            DraggableScrollableSheet(
              maxChildSize: 0.6,
              builder : (context,controller)=>
                  Container(
                    color: Colors.white,
                    child:
                    ListView.builder(controller: controller,
                      itemCount:1,
                      itemBuilder: (BuildContext context, int index) {
                        return
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: AppPadding.p8),
                                    child: Icon(Icons.gps_fixed,color: ColorManager.icon,size: AppSize.s18,),
                                  ),
                                  Text(
                                    Provider.of<DailyReservationViewModel>(context).getTodayTrip()?.lines?.first.name ??"",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:Theme.of(context).textTheme.labelLarge,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: AppPadding.p12),
                                child: ListView .  separated(
                                    shrinkWrap: true,
                                    //   scrollDirection: Axis.vertical,
                                    separatorBuilder: (context, index) => const SizedBox(
                                      width: double.infinity,
                                      height: AppSize.s1_5,
                                      // color: Color,
                                    ),
                                    itemCount:
                                    Provider.of<DailyReservationViewModel>(context).getTodayTrip()!.dataTransferPositions!.length,
                                    itemBuilder: (context, index) =>index+1==3?
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        RadioListTile(
                                          value: index,
                                          groupValue: Provider.of<DailyReservationMap>(context).getSelectedValue(),
                                          onChanged: (value) {
                                            Provider.of<DailyReservationMap>(context,listen: false).setSelectedValue(value ??0);
                                          },
                                          title: Text(
                                            Provider.of<DailyReservationViewModel>(context).getTodayTrip()!.dataTransferPositions![index].name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:Theme.of(context).textTheme.headlineMedium,
                                          ),
                                        ),
                                      ],
                                    )

                                        :Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        RadioListTile(
                                          value: index,
                                          groupValue: Provider.of<DailyReservationMap>(context).getSelectedValue(),
                                          onChanged: (value) {
                                            setState(() {
                                              Provider.of<DailyReservationMap>(context,listen: false).setSelectedValue(value??0);                                            });
                                          },
                                          title: Text(
                                            Provider.of<DailyReservationViewModel>(context).getTodayTrip()!.dataTransferPositions![index].name,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style:Theme.of(context).textTheme.headlineMedium,
                                          ),
                                        ),
                                      ],
                                    )

                                ),
                              ),
                              Card(
                                elevation: 2,
                                //color: ColorManager.profile,
                                child: Form(
                                  key: _forKey,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: AppSize.s8),
                                              child: Text("Enter your information",style: getBoldStyle(color: ColorManager.sidBarIcon,fontSize: FontSize.s18),),

                                            ),
                                            Expanded(
                                                child: Divider(
                                                  height: 3,
                                                  color: ColorManager.sidBarIcon,
                                                  thickness: 1,
                                                )),
                                          ],
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: AppPadding.p28,
                                            left: AppPadding.p28,
                                            bottom: AppPadding.p20),
                                        child: Column(children: [
                                          // Center(child: Image.asset(ImageAssets.logo4)),


                                          const SizedBox(
                                            height: 50,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: AppPadding.p20, right: AppPadding.p20),
                                            child: TextFormField(
                                              controller: nameController,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return LocaleKeys.errorFirstName.tr();
                                                } else {
                                                  // Provider.of<SignUpViewModel>(context,
                                                  // listen: false)
                                                  //     .setFirstName(value);
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                hintText: LocaleKeys.name.tr(),
                                                labelText: LocaleKeys.name.tr(),
                                                prefixIcon: Icon(
                                                  Icons.perm_identity,
                                                  color: ColorManager.kMainColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: AppPadding.p20, right: AppPadding.p20),
                                            child: TextFormField(
                                              controller: phoneNumberController,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return LocaleKeys.errorPhoneNumber.tr();
                                                } else {
                                                  // Provider.of<SignUpViewModel>(context,
                                                  // listen: false)
                                                  //     .setFirstName(value);
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                hintText: LocaleKeys.ePhoneNumber.tr(),
                                                labelText: LocaleKeys.ePhoneNumber.tr(),
                                                prefixIcon: Icon(
                                                  Icons.phone,
                                                  color: ColorManager.kMainColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          // Padding(
                                          //   padding: const EdgeInsets.only(
                                          //       left: AppPadding.p28, right: AppPadding.p28),
                                          //   child: DropdownButtonFormField(
                                          //     icon: const Icon(Icons.keyboard_arrow_down),
                                          //     hint:
                                          //     Text(LocaleKeys.transferPositions.tr()),
                                          //     validator: (value) {
                                          //       if (value == null) {
                                          //         return LocaleKeys.transferPositions.tr();
                                          //       }
                                          //       return null;
                                          //     },
                                          //     items: _register1
                                          //         .getPosition()
                                          //         .map((e) => DropdownMenuItem(
                                          //       value: e,
                                          //       child: Text(" ${e.name}"),
                                          //     ))
                                          //         .toList(),
                                          //     onChanged: (val) {
                                          //       Provider.of<SignUpViewModel>(context,
                                          //           listen: false)
                                          //           .setTransferPositionId(val!.id);
                                          //     },
                                          //   ),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: AppPadding.p20, right: AppPadding.p20),
                                            child: TextFormField(
                                              controller: seatsNumberController,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return LocaleKeys.seat.tr();
                                                } else {
                                                  // Provider.of<SignUpViewModel>(context,
                                                  // listen: false)
                                                  //     .setFirstName(value);
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                hintText: LocaleKeys.seat.tr(),
                                                labelText: LocaleKeys.seat.tr(),
                                                prefixIcon: Icon(
                                                  Icons.event_seat,
                                                  color: ColorManager.kMainColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 90,),
                                          ElevatedButton(onPressed: ()
                                          {

                                          }, child: Text(LocaleKeys.send.tr()))
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        //ListTile(title: Text("position"),);
                      },
                    ) ,
                  ),
            ),
          ],

        ):
        Center(
          child: StateRenderer(
              stateRendererType: StateRendererType.fullScreenEmptyState,
              message: "Not found positions",
              retryActionFunction: () {}),
        )
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