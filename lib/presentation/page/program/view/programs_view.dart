import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/page/drawer/view/drawer.dart';
import 'package:untitled/presentation/page/program/view_model/programs_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

import '../../../../lang/locale_keys.g.dart';
import '../../../resources/routes_manager.dart';

class ProgramsView extends StatefulWidget {
  @override
  State<ProgramsView> createState() => _ProgramsViewState();
}

class _ProgramsViewState extends State<ProgramsView>
    with SingleTickerProviderStateMixin {

  var viewModel;
  @override
  void initState() {
    viewModel = Provider.of<ProgramsViewModel>(context, listen: false);
    viewModel.start();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Consumer<ProgramsViewModel>(
        builder: (context, model, child) =>
         Scaffold(
           appBar: AppBar(
             actions: [
               Provider.of<Not>(context).getCount()==0
                   ? IconButton(onPressed: () {print("0");}, icon: const Icon(Icons.notifications))
                   : Padding(
                 padding: const EdgeInsets.all(20),
                 child: InkWell(
                   child: Badge(
                     badgeContent: Text("${ Provider.of<Not>(context).getCount()}",style: TextStyle(color: Colors.white),),

                     child: Icon(Icons.notifications,size: AppSize.s30),
                     badgeAnimation: BadgeAnimation.fade(animationDuration: Duration(milliseconds:250 )),
                   ),
                   onTap: ()
                   {
                     print("kkkkkk");
                     Navigator.pushNamed(context,Routes.notification);
                   },
                 ),
               ),
             ],
             title: Text(LocaleKeys.Program.tr(),
                 style: getBoldStyle(
                     color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
           ),
           drawer:  NavBar(),
           body: SafeArea(child:
          orientation == Orientation.portrait
              ? Column(
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
              SizedBox(height: 10.h),

              Expanded(
                child: model.getProgramDay().isEmpty
                    ? Center(
                  child: Text(
                    '${LocaleKeys.notrip.tr()}',
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
                                TripStudentWidget(trip: model.getProgramDay()[index])),
                  ),
                ),
              ),
              Text(
                LocaleKeys.Rating.tr(),
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
                    SizedBox(height: 5.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:AppPadding.p5),
                      child: Expanded(
                        child: model.getProgramDay().isEmpty
                            ?  Center(
                          child: Text(
                            '${LocaleKeys.notrip.tr()}',
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
                                        TripStudentWidget(trip: model.getProgramDay()[index])),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      LocaleKeys.Rating.tr(),
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
        ),
      )!;
    }
    );
  }



  }
class TripStudentWidget extends StatelessWidget {
  final DataProgram trip;

  const TripStudentWidget({Key? key, required this.trip}) : super(key: key);

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
          Row(
            children: [
              Text(LocaleKeys.GoingConfirm.tr()),
              Checkbox(
                value: trip.confirmAttendance1,
                onChanged: (bool? value) {
                  Provider.of<ProgramsViewModel>(
                      context,
                      listen: false)
                      .setConfirm1( Provider.of<ProgramsViewModel>(
                      context,
                      listen: false).getIndexDay(), value ?? false);
                  Provider.of<ProgramsViewModel>(
                      context,
                      listen: false)
                      .confirmStudent();
                },
              ),
              Text(
                LocaleKeys.Returningconfirm.tr(),
              ),
              Checkbox(
                value: trip.confirmAttendance2,
                onChanged: (bool? value) {
                  Provider.of<ProgramsViewModel>(
                      context,
                      listen: false)
                      .setConfirm2( Provider.of<ProgramsViewModel>(
                      context,
                      listen: false).getIndexDay(), value ??false);
                  Provider.of<ProgramsViewModel>(
                      context,
                      listen: false)
                      .confirmStudent();
                },
              ),
            ],
          ),

        ]),
      ),
    );
  }
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
/*
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
 */
/*
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

 */
/*
getWedgit() {
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
                                Provider.of<ProgramsViewModel>(context,listen: false)
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
                              LocaleKeys.Gotime.tr(),
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
                              LocaleKeys.Returntime.tr(),
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
                              LocaleKeys.Position.tr(),
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
                                LocaleKeys.Gotime.tr(),
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
                                LocaleKeys.Returntime.tr(),
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
                                LocaleKeys.Position.tr(),
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
      }
      );

  }
 */