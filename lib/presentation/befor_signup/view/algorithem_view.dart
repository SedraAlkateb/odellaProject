import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/presentation/resources/color_manager.dart';

import '../../../lang/local_keys.g.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';

class SelectTimes extends StatefulWidget {
  const SelectTimes({super.key});

  @override
  _SelectTimesState createState() => _SelectTimesState();
}

class _SelectTimesState extends State<SelectTimes> {
  final List<String> _dropdownValues = ['9:00', '9:30', '10','10:30','11','11:30'];
  final List<String> _dropdownValues2 = ['12:00', '12:30', '13:00','13:30','14:00','14,:30','15:00','15:30','16:00'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Stack(
        children: [

          ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => const SizedBox(
                width: double.infinity,
                height: AppSize.s20,
                // color: Color,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return
                  Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 250,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s30)),
                      // color: Colors.redAccent,

                      //        color: ColorManager.card,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 1.h,),
                        Text("day"),
                        SizedBox(height: 1.h,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height:3.h,
                                    ),
                                    Text(LocaleKeys.Gotime.tr())
                                  ],
                                ),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Text("   ${LocaleKeys.university.tr()} "),
                                    SizedBox(
                                      height: 10.h,
                                      width: 65.w,
                                      child: DropdownButtonFormField(
                                          icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                          hint: Text(
                                              "Times"),
                                          validator: (value) {
                                            if (value == null) {
                                              return LocaleKeys.transportationLines
                                                  .tr();
                                            }
                                            //  return null;
                                          },
                                          items: _dropdownValues
                                              .map((value) => DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          ))
                                              .toList(),
                                          onChanged: (val) {}),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(LocaleKeys.Returntime.tr())
                                  ],
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Text("   ${LocaleKeys.university.tr()} "),
                                    SizedBox(
                                      height: 14.h,
                                      width: 65.w,
                                      child: DropdownButtonFormField(
                                          icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                          hint: Text(
                                              "Times"),
                                          validator: (value) {
                                            if (value == null) {
                                              return LocaleKeys.transportationLines
                                                  .tr();
                                            }
                                            //  return null;
                                          },
                                          items: _dropdownValues2
                                              .map((value) => DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          ))
                                              .toList(),
                                          onChanged: (val) {}),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              ),
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p28),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.signupRoute);
          },
          child: Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
                radius: 30,
                backgroundColor: ColorManager.icon,
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: ColorManager.white,
                  size: 60,
                )),
          ),
        ),
      ),

        ],
      ),
    );
  }
}
