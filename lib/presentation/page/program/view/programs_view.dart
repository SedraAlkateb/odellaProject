import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/page/program/view_model/programs_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

class ProgramsView extends StatefulWidget {
  @override
  State<ProgramsView> createState() => _ProgramsViewState();
}

class _ProgramsViewState extends State<ProgramsView>
    with SingleTickerProviderStateMixin {
  // late TabController controllerr;
  String selectedDay = StringsManager.sat;
  late bool checked;
  int length = 0;
  var viewModel;
  int pos = 0;
  List<String> weekDays = [];
  bool myBool2 = false;
  bool myBool = false;

  @override
  void initState() {
    viewModel = Provider.of<ProgramsViewModel>(context, listen: false);
    viewModel.start();
    length = Provider.of<ProgramsViewModel>(context, listen: false).getLine();
    weekDays =
        Provider.of<ProgramsViewModel>(context, listen: false).getWeekDays();
    //   controllerr = new TabController(length:length, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider
        .of<ProgramsViewModel>(context)
        .getProgram()
        .length != 0) {
      pos = Provider.of<ProgramsViewModel>(context).getPos();
      selectedDay = Provider.of<ProgramsViewModel>(context).getSelectedDay();
      myBool2 = Provider.of<ProgramsViewModel>(context).getConfirm2(pos);
      myBool = Provider.of<ProgramsViewModel>(context).getConfirm1(pos);
      return Sizer(builder: (context, orientation, deviceType) {
        return Scaffold(
          body:
          SafeArea(
            child: orientation == Orientation.portrait
                ? Column(
              children: [
                Container(
                  height: 10.h,
                  color: ColorManager.sidBar,
                  child: Row(
                    children: List.generate(
                      weekDays.length,
                          (index) =>
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Provider.of<ProgramsViewModel>(context)
                                    .setPos(index);
                                setState(() {
                                  selectedDay = weekDays[index];
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: pos == weekDays.length - 1
                                          ? Colors.transparent
                                          : ColorManager.sidBar,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  weekDays[pos],
                                  style: TextStyle(
                                    color: selectedDay == weekDays[pos]
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
                SizedBox(height: 10.h),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later,
                              color: ColorManager.sidBar,
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              StringsManager.go_time,
                              style: const TextStyle(
                                  fontSize: FontSize.s14),
                            ),
                            Text(Provider.of<ProgramsViewModel>(
                                context)
                                .getProgram()[pos]
                                .start)
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later,
                              color: ColorManager.sidBar,
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              StringsManager.return_time,
                              style: const TextStyle(
                                  fontSize: FontSize.s14),
                            ),
                            Text(Provider.of<ProgramsViewModel>(
                                context)
                                .getProgram()[pos]
                                .end)
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: ColorManager.sidBar,
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              StringsManager.postion,
                              style: const TextStyle(
                                  fontSize: FontSize.s14),
                            ),
                            Text(Provider.of<ProgramsViewModel>(
                                context)
                                .getProgram()[pos]
                                .dataTransferPositions!
                                .name)
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Text(StringsManager.go_confirm),
                            Checkbox(
                              value: myBool,
                              onChanged: (bool? value) {
                                Provider.of<ProgramsViewModel>(
                                    context,
                                    listen: false)
                                    .setIndex(pos);
                                myBool = value ?? false;
                                Provider.of<ProgramsViewModel>(
                                    context,
                                    listen: false)
                                    .setConfirm1(pos, myBool);
                                Provider.of<ProgramsViewModel>(
                                    context,
                                    listen: false)
                                    .confirmStudent();
                              },
                            ),
                            Text(
                              StringsManager.return_confirm,
                            ),
                            Checkbox(
                              value: myBool2,
                              onChanged: (bool? value) {
                                Provider.of<ProgramsViewModel>(
                                    context,
                                    listen: false)
                                    .setIndex(pos);
                                myBool2 = value ?? false;
                                Provider.of<ProgramsViewModel>(
                                    context,
                                    listen: false)
                                    .setConfirm2(pos, myBool2);
                                Provider.of<ProgramsViewModel>(
                                    context,
                                    listen: false)
                                    .confirmStudent();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  StringsManager.rating,
                  style:
                  const TextStyle(fontWeight: FontWeight.bold),
                ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  //   allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p2),
                  itemBuilder: (context, _) =>
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    Provider.of<ProgramsViewModel>(context,
                        listen: false)
                        .evaluation(rating.toInt());
                  },
                ),
                SizedBox(height: 14.h),
              ],
            )
                : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 7.h,
                    color: ColorManager.sidBar,
                    child: Row(
                      children: List.generate(
                        weekDays.length,
                            (index) =>
                            Expanded(
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
                                        color:
                                        index == weekDays.length - 1
                                            ? Colors.transparent
                                            : ColorManager.sidBar,
                                      ),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    weekDays[index],
                                    style: TextStyle(
                                      color:
                                      selectedDay == weekDays[index]
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
                  SizedBox(height: 5.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p5),
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: ColorManager.sidBar,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                StringsManager.go_time,
                                style: const TextStyle(
                                    fontSize: FontSize.s14),
                              ),
                              Text(Provider.of<ProgramsViewModel>(
                                  context)
                                  .getProgram()[pos]
                                  .start)
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: ColorManager.sidBar,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                StringsManager.return_time,
                                style: const TextStyle(
                                    fontSize: FontSize.s14),
                              ),
                              const Text("data"),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: ColorManager.sidBar,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                StringsManager.postion,
                                style: const TextStyle(
                                    fontSize: FontSize.s14),
                              ),
                              const Text("data"),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Text(StringsManager.go_confirm),
                              Checkbox(
                                value: myBool,
                                onChanged: (bool? value) {
                                  Provider.of<ProgramsViewModel>(
                                      context,
                                      listen: false)
                                      .setIndex(pos);
                                  myBool = value ?? false;
                                  Provider.of<ProgramsViewModel>(
                                      context,
                                      listen: false)
                                      .setConfirm1(pos, myBool);
                                  Provider.of<ProgramsViewModel>(
                                      context,
                                      listen: false)
                                      .confirmStudent();
                                },
                              ),
                              Text(
                                StringsManager.return_confirm,
                              ),
                              Checkbox(
                                value: myBool2,
                                onChanged: (bool? value) {
                                  Provider.of<ProgramsViewModel>(
                                      context,
                                      listen: false)
                                      .setIndex(pos);
                                  myBool2 = value ?? false;
                                  Provider.of<ProgramsViewModel>(
                                      context,
                                      listen: false)
                                      .setConfirm2(pos, myBool2);
                                  Provider.of<ProgramsViewModel>(
                                      context,
                                      listen: false)
                                      .confirmStudent();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    StringsManager.rating,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding:
                    const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) =>
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: 3.h),
                ],
              ),
            ),
          ),

        );
      });
    }
    if (Provider
        .of<ProgramsViewModel>(context)
        .getProgram()
        .length != 0) {

      return Sizer(builder: (context, orientation, deviceType) {
        return LoadingState(stateRendererType: StateRendererType.fullScreenEmptyState).getScreenWidget(context, Scaffold(
            body:
            SafeArea(
              child: Container(),
            )

        ), (){});
      }
      );
    }

    return Sizer(builder: (context, orientation, deviceType) {
        return LoadingState(stateRendererType: StateRendererType.fullScreenErrorState).getScreenWidget(context, Scaffold(
            body:
            SafeArea(
              child: Container(),
            )

        ), (){});
      }
      );
  }
}

  AppBar getAppBarProgram() {
    return AppBar(
      title: Text(StringsManager.program,
          style: getBoldStyle(
              color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
    );
  }

/*
 Container(
          height: 200,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Card(
                elevation: 3,
                child: DataTable(
                  columnSpacing: 19,
                  columns: const [
                    DataColumn(
                      label: Text("days"),
                    ),
                    DataColumn(
                      label: Text("time to go"),
                    ),
                    DataColumn(label: Text("time to arrive")),
                    DataColumn(
                      label: Text("position"),
                    ),
                    DataColumn(
                      label: Text("check go"),
                    ),
                    DataColumn(
                      label: Text("check back"),
                    ),
                  ],
                  rows: List.generate(
                      Provider
                          .of<ProgramsViewModel>(context)
                          .getProgram()
                          .length,
                          (index) {
                        final x = Provider.of<ProgramsViewModel>(context)
                            .getProgram()[index].day;
                        final y = Provider.of<ProgramsViewModel>(context)
                            .getProgram()[index].start;
                        final z = Provider.of<ProgramsViewModel>(context)
                            .getProgram()[index].end;
                        final w = Provider.of<ProgramsViewModel>(context)
                            .getProgram()[index].dataTransferPositions!.name;
                        bool myBool = Provider.of<ProgramsViewModel>(context)
                            .getConfirm1(index);
                        bool myBool2 = Provider.of<ProgramsViewModel>(context)
                            .getConfirm2(index);
                        final item = Provider.of<ProgramsViewModel>(context)
                            .getProgram()[index].confirmAttendance1;
                        bool select;
                        return DataRow(
                          cells: [
                            DataCell(
                              Text(x),
                            ),
                            DataCell(
                              Text(y),
                            ),
                            DataCell(
                              Text(z),
                            ),
                            DataCell(Text(w)),
                            DataCell(
                              Checkbox(
                                value: myBool,
                                onChanged: (bool? value) {
                                  Provider.of<ProgramsViewModel>(
                                      context, listen: false).setIndex(index);
                                  myBool = value ?? false;
                                  Provider.of<ProgramsViewModel>(
                                      context, listen: false).setConfirm1(
                                      index, myBool);
                                  Provider.of<ProgramsViewModel>(
                                      context, listen: false).confirmStudent();
                                },
                              ),
                            ),
                            DataCell(
                              Checkbox(
                                value: myBool2,
                                onChanged: (bool? value) {
                                  Provider.of<ProgramsViewModel>(
                                      context, listen: false).setIndex(index);
                                  myBool2 = value ?? false;
                                  Provider.of<ProgramsViewModel>(
                                      context, listen: false).setConfirm2(
                                      index, myBool2);
                                  Provider.of<ProgramsViewModel>(
                                      context, listen: false).confirmStudent();
                                },
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
              // ElevatedButton(onPressed: ()
              //     async {
              //       bool check=checked;
              //       Services.sendConfirmAttendence(check);
              //     }, child: Text('save')),
              //
            ],
          ),
        ),
 */
