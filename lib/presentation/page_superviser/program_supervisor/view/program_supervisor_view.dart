import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/presentation/page/program/view_model/programs_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/daily_recieve/model.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/style_manage.dart';

class SupervisorProgramView extends StatefulWidget {
  const SupervisorProgramView({super.key});

  @override
  _SupervisorProgramViewState createState() => _SupervisorProgramViewState();
}

class _SupervisorProgramViewState extends State<SupervisorProgramView> {

  List<String> weekDays = ['${StringsManager.mon}', '${StringsManager.tus}', '${StringsManager.wed}', '${StringsManager.thu}','${StringsManager.fri}','${StringsManager.sat}', '${StringsManager.sun}', ];
  Map<String, List<Trip>> trips = {
    'Sat': [
      Trip(
        tripLine: 'tripLine',
        tripStartTime: 'tripStartTime',
        tripEndTime: 'tripEndTime',
        tripDate: 'tripDate',
        tripSeats: ['1', '5', '6'],
        tripPosition: 'tripPosition',
      ),
      Trip(
        tripLine: 'tripLine',
        tripStartTime: 'tripStartTime',
        tripEndTime: 'tripEndTime',
        tripDate: 'tripDate',
        tripSeats: ['1', '5', '6'],
        tripPosition: 'tripPosition',
      ),
    ],
    'Sun': [],
    'Mon': [],
    'Tus': [
      Trip(
        tripLine: 'tripLine',
        tripStartTime: 'tripStartTime',
        tripEndTime: 'tripEndTime',
        tripDate: 'tripDate',
        tripSeats: ['1', '5', '6'],
        tripPosition: 'tripPosition',
      ),
      Trip(
        tripLine: 'tripLine',
        tripStartTime: 'tripStartTime',
        tripEndTime: 'tripEndTime',
        tripDate: 'tripDate',
        tripSeats: ['1', '5', '6'],
        tripPosition: 'tripPosition',
      ),
      Trip(
        tripLine: 'tripLine',
        tripStartTime: 'tripStartTime',
        tripEndTime: 'tripEndTime',
        tripDate: 'tripDate',
        tripSeats: ['1', '5', '6'],
        tripPosition: 'tripPosition',
      ),
    ],
    'Wed': [],
    'Thu': [],
  };
  String selectedDay = 'Sat';
  var viewModel;
@override
  void initState() {
  viewModel=Provider.of<ProgramsViewModel>(context,listen: false);
  viewModel.start();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: SafeArea(
          child: orientation == Orientation.portrait
              ?Column(
            children: [
              Container(
                height: 10.h,
                color: ColorManager.sidBar,
                child: Row(
                  children: List.generate(
                    weekDays.length,
                        (index) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = weekDays[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: index == weekDays.length - 1
                                    ? Colors.transparent
                                    : ColorManager.sidBar,
                              ),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            weekDays[index],
                            style: TextStyle(
                              color: selectedDay == weekDays[index]
                                  ? Colors.white
                                  : ColorManager.sidBar,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: trips[selectedDay]!.isEmpty
                    ? Center(
                  child: Text(
                    '${StringsManager.no_trip}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                    : Padding(
                  padding:  EdgeInsets.symmetric(vertical: 15.sp),
                  child: ListView(
                    children: List.generate(
                        trips[selectedDay]!.length,
                            (index) =>
                            TripWidget(trip: trips[selectedDay]![index])),
                  ),
                ),
              ),
            ],
          )
              :Column(
            children: [
              Container(
                height: 7.h,
                color: ColorManager.sidBar,
                child: Row(
                  children: List.generate(
                    weekDays.length,
                        (index) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = weekDays[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: index == weekDays.length - 1
                                    ? Colors.transparent
                                    : ColorManager.sidBar,
                              ),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            weekDays[index],
                            style: TextStyle(
                              color: selectedDay == weekDays[index]
                                  ? Colors.white
                                  : ColorManager.sidBar,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: trips[selectedDay]!.isEmpty
                    ?  Center(
                  child: Text(
                    '${StringsManager.no_trip}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                    : Padding(
                  padding:  EdgeInsets.symmetric(vertical: 16.sp),
                  child: ListView(
                    children: List.generate(
                        trips[selectedDay]!.length,
                            (index) =>
                            TripWidget(trip: trips[selectedDay]![index])),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    );
  }
}

class TripWidget extends StatelessWidget {
  final Trip trip;

  const TripWidget({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration:  BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.access_time_filled,
                  color: ColorManager.sidBar,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '${StringsManager.go_time} ${trip.tripStartTime}',
                  style:  TextStyle(
                    color: ColorManager.sidBar,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.access_time_filled,
                  color: ColorManager.sidBar,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '${StringsManager.return_time} ${trip.tripEndTime}',
                  style:  TextStyle(
                    color: ColorManager.sidBar,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.access_time_filled,
                  color: ColorManager.sidBar,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '${StringsManager.postion} ${trip.tripPosition}',
                  style: TextStyle(
                    color: ColorManager.sidBar,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
AppBar getAppBarProgram2() {
  return AppBar(
    title: Text(StringsManager.program,
        style: getBoldStyle(
            color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
  );
}
