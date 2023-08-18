import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/presentation/befor_signup/view_model/algorithem_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';

import '../../../lang/local_keys.g.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';

class SelectTimes extends StatefulWidget {
  const SelectTimes({super.key});

  @override
  _SelectTimesState createState() => _SelectTimesState();
}

class _SelectTimesState extends State<SelectTimes> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Program",style:TextStyle(color: ColorManager.sidBarIcon,fontSize: 20)),
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
              itemCount: Provider.of<AlgorithmViewModel>(context,listen: false).getWeekDay().length,
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
                    ),
                    child:
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 1),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(Provider.of<AlgorithmViewModel>(context, listen: false).getWeekDay()[index]),
                                ),
                                SizedBox(height: 20),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child: Text(LocaleKeys.Gotime.tr())),
                                      Expanded(
                                        child: SizedBox(
                                          child: DropdownButtonFormField(
                                            icon: Icon(Icons.keyboard_arrow_down),
                                            hint: Text("Times"),
                                            validator: (value) {
                                              if (value == null) {
                                                return LocaleKeys.transportationLines.tr();
                                              }
                                              //  return null;
                                            },
                                            items: Provider.of<AlgorithmViewModel>(context).getGoTime().map((value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(value),
                                            )).toList(),
                                            onChanged: (val) {
                                              /*
                          if(Provider.of<AlgorithmViewModel>(context).getIndex() == 9) {
                            Provider.of<AlgorithmViewModel>(context, listen: false).setIndex(index);
                            Provider.of<AlgorithmViewModel>(context, listen: false).setGoTime(val ?? "");
                          } else {
                            // Other logic
                          }
                          */
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child: Text(LocaleKeys.Gotime.tr())),
                                      Expanded(
                                        child: SizedBox(
                                          child: DropdownButtonFormField(
                                            icon: Icon(Icons.keyboard_arrow_down),
                                            hint: Text("Times"),
                                            validator: (value) {
                                              if (value == null) {
                                                return LocaleKeys.transportationLines.tr();
                                              }
                                              //  return null;
                                            },
                                            items: Provider.of<AlgorithmViewModel>(context).returnTimeList().map((value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(value),
                                            )).toList(),
                                            onChanged: (val) {
                                              /*
                          if(Provider.of<AlgorithmViewModel>(context).getIndex() == 9) {
                            Provider.of<AlgorithmViewModel>(context, listen: false).setIndex(index);
                            Provider.of<AlgorithmViewModel>(context, listen: false).setGoTime(val ?? "");
                          } else {
                            // Other logic
                          }
                          */
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(onPressed: (){}, icon: Icon(Icons.check_circle)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),                  ),
                );
              }
              ),
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p28),
        child: Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.signupRoute);
            },
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
