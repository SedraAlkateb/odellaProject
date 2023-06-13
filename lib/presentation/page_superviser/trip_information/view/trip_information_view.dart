import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/presentation/map/poltline_map_view.dart';
import 'package:untitled/presentation/page_superviser/daily_recieve/model.dart';
import 'package:untitled/presentation/page_superviser/home_supervisor/view_model/home_super_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class TripInformationView extends StatefulWidget {

  const TripInformationView({super.key});

  @override
  _TripInformationViewState createState() => _TripInformationViewState();
}

class _TripInformationViewState extends State<TripInformationView> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Consumer<HomeSuperVisorViewModel>(
          builder: (context, model, child) =>
           Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: ColorManager.sidBarIcon,
              ),
              title: Text(
                StringsManager.trip_information,
                style: TextStyle(
                  color: ColorManager.sidBarIcon,
                ),
              ),
            ),
            body: SafeArea(
                child: orientation == Orientation.portrait
                    ? Column(
                  children: [
                    Expanded(
                       child: PolylineMapView(position:  model.getHomeSuperVisor().dataTransferPositions!)
                    ),
                    SizedBox(height: 2.h),
                    Padding(
                      padding:  EdgeInsets.only(left: 20.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${StringsManager.line_name}: ${model.getHomeSuperVisor().lines![0].name}'),
                          SizedBox(height: 1.5.h),
                          Text('${StringsManager.go_time}: ${model.getHomeSuperVisor().time!.start}'),
                          SizedBox(height: 1.5.h),
                          Text('${StringsManager.return_time}: ${model.getHomeSuperVisor().time!.date}'),
                          SizedBox(height: 1.5.h),
                          Text('${StringsManager.available_seats}: ${model.getHomeSuperVisor().availableSeats}'),
                          SizedBox(height:1.5.h),
                        /*
                          Row(
                            children: [
                              Text('${StringsManager.available_seats} '),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List<Widget>.generate(
                                      widget.trip.tripSeats.length,
                                          (index) => Padding(
                                        padding:
                                        EdgeInsets.all(5.0),
                                        child: Text(
                                            widget.trip.tripSeats[index]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                         */
                          SizedBox(height: 5.h),
                        ],
                      ),
                    ),
                  ],
                )
                    : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p18, vertical: AppPadding.p18),
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${StringsManager.line_name}: ${model.getHomeSuperVisor().lines![0].name}'),
                          const SizedBox(height: 10),
                          Text('${StringsManager.go_time}: ${model.getHomeSuperVisor().time!.start}'),
                          const SizedBox(height: 10),
                          Text('${StringsManager.return_time}: ${model.getHomeSuperVisor().time!.date}'),
                          const SizedBox(height: 10),
                          Text('${StringsManager.available_seats}: ${model.getHomeSuperVisor().availableSeats}'),
                         /*
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text('${StringsManager.available_seats} '),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List<Widget>.generate(
                                      widget.trip.tripSeats.length,
                                          (index) => Padding(
                                        padding:
                                        const EdgeInsets.all(5.0),
                                        child: Text(
                                            widget.trip.tripSeats[index]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          */
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
        );
      },
    );
  }
}
