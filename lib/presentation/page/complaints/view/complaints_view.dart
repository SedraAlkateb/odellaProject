import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/page/complaints/view_model/complaints_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/style_manage.dart';
import '../../../resources/values_manager.dart';
import 'package:sizer/sizer.dart';

class ComplaintsView extends StatefulWidget {
  const ComplaintsView({Key? key}) : super(key: key);

  @override
  State<ComplaintsView> createState() => _ComplaintsViewState();
}

class _ComplaintsViewState extends State<ComplaintsView> {
  TextEditingController textEditingController = TextEditingController();
  String dropdownTransportationLine = 't1';
  var viewModel;
@override
  void initState() {
  viewModel = Provider.of<ComplaintsViewModel>(context, listen: false);
  viewModel.start();
//  Provider.of<ComplaintsViewModel>(context).start();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return SingleChildScrollView(
          child: orientation == Orientation.portrait
              ? Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(16.sp),
                child: TextField(
                  controller: textEditingController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: StringsManager.enter_complaint,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.w, color: ColorManager.sidBar),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 0.5.w, color: Colors.grey),
                    ),
                  ),
                    onChanged: (value)=>Provider.of<ComplaintsViewModel>(context,listen: false).setDescription(value),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringsManager.select_trip,
                    style: TextStyle(fontSize: AppSize.s20),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  DropdownButton(
                    value: dropdownTransportationLine,
                    items: <String>['t1', 't2', 't3', 't4']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: SizedBox(
                          width: 8.w,
                          child: Text(
                            value,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: AppSize.s15),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownTransportationLine = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              const Text(
                "data 1",
                style:
                TextStyle(fontSize: AppSize.s15, color: Colors.grey),
              ),
              SizedBox(height: 2.h),
              const Text(
                "data 2",
                style:
                TextStyle(fontSize: AppSize.s15, color: Colors.grey),
              ),
              SizedBox(height: 2.h),
              ElevatedButton(
                onPressed: () {
                  Provider.of<ComplaintsViewModel>(context,listen: false).storeClaim();
                },
                child: Text(
                  StringsManager.send,
                ),
              ),
              SizedBox(height: 5.h),
            ],
          )
              : Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${StringsManager.select_trip}'':',
                          style: TextStyle(fontSize: AppSize.s20),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        DropdownButton(
                          value: dropdownTransportationLine,
                          items: <String>[
                            't1',
                            't2',
                            't3',
                            't4'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: SizedBox(
                                width: 8.w,
                                child: Text(
                                  value,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: AppSize.s15),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownTransportationLine = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Text(
                      "data 1",
                      style: TextStyle(
                          fontSize: AppSize.s15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Text("data 2",
                        style: TextStyle(
                            fontSize: AppSize.s15, color: Colors.grey)),
                    SizedBox(
                      height: 1.h,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(StringsManager.send)),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: TextField(
                    controller: textEditingController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: StringsManager.enter_complaint,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.w, color: ColorManager.sidBar),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 0.5.w, color: Colors.grey),
                      ),

                    ),
                    onTap: () =>Provider.of<ComplaintsViewModel>(context).storeClaim() ,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

AppBar getAppBarComplaint() {
  return AppBar(
    title: Text(StringsManager.complaints,
        style: getBoldStyle(
            color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
  );
}
