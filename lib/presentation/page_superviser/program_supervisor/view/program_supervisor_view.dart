import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/presentation/component/icon_notification.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/page/program/view_model/programs_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/daily_recieve/model.dart';
import 'package:untitled/presentation/page_superviser/drawer/view/drawer.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/style_manage.dart';

class SupervisorProgramView extends StatefulWidget {
  const SupervisorProgramView({super.key});

  @override
  _SupervisorProgramViewState createState() => _SupervisorProgramViewState();
}

class _SupervisorProgramViewState extends State<SupervisorProgramView> {

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
      return Consumer<ProgramsViewModel>(
        builder: (context, model, child) =>
         Scaffold(
           appBar:  AppBar(
             actions: [
               notificationIcon(context)
             ],
             title: Text(LocaleKeys.Program.tr(),
                 style: getBoldStyle(
                     color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
           ),
           drawer:  DrawerSupervisorView(),
           body: SafeArea(
            child: orientation == Orientation.portrait
                ?Column(
              children: [
                Container(
                  height: 10.h,
                  color: ColorManager.sidBar,
                  child: Row(
                    children: List.generate(
                      model.getWeekDays().length,
                          (index) => Expanded(
                        child: GestureDetector(
                          onTap: () {
                            model.setSelectedDay(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: index == model.getWeekDays().length - 1
                                      ? Colors.transparent
                                      : ColorManager.sidBar,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              model.getDay(index),
                              style: TextStyle(
                                color: model.getSelectedDay() == model.getDay(index)
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
                  child: model.getProgramDay().isEmpty
                      ? Center(
                    child: Text(
                      '${LocaleKeys.Rating.tr()}',
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
                          model.getProgramDay().length,
                              (index) =>
                              TripWidget(trip: model.getProgramDay()[index])),
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
                      model.getWeekDays().length,
                          (index) => Expanded(
                        child: GestureDetector(
                          onTap: () {
                            model.setSelectedDay(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: index == model.getWeekDays().length - 1
                                      ? Colors.transparent
                                      : ColorManager.sidBar,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              model.getDay(index),
                              style: TextStyle(
                                color: model.getSelectedDay() == model.getDay(index)
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
                  child: model.getProgramDay().isEmpty
                      ?  Center(
                    child: Text(
                      '${LocaleKeys.Rating.tr()}',
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
                          model.getProgramDay().length,
                              (index) =>
                              TripWidget(trip: model.getProgramDay()[index])),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    );
  }
}

class TripWidget extends StatelessWidget {
  final DataProgram trip;

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
                  '${LocaleKeys.Gotime.tr()} ${trip.start}',
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
                  '${LocaleKeys.Returntime.tr()} ${trip.end}',
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
                  '${LocaleKeys.Position.tr()} ${trip.dataTransferPositions?.name}',
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
