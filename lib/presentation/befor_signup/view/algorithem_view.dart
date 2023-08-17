import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/presentation/befor_signup/view_model/algorithem_viewmodel.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView.separated(
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
                        // color: Colors.redAccent,

                        //        color: ColorManager.card,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 1),
                                  Align(alignment: Alignment.topRight,child: Text(Provider.of<AlgorithmViewModel>(context,listen: false).getWeekDay()[index])),
                                  SizedBox(height: 20,),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height:3,
                                        ),
                                        Text(LocaleKeys.Gotime.tr()),
                                        SizedBox(
                                          height: 40,
                                          width: 100,
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
                                              items: Provider.of<AlgorithmViewModel>(context).getGoTime()
                                                  .map((value) => DropdownMenuItem(
                                                value: value,
                                                child: Text(value),
                                              ))
                                                  .toList(),
                                              onChanged: (val) {
                                                if( Provider.of<AlgorithmViewModel>(context).getIndex()==9){
                                                  Provider.of<AlgorithmViewModel>(context,listen: false).setIndex(index);
                                                  Provider.of<AlgorithmViewModel>(context,listen: false).setGoTime(val??"");
                                                }else{

                                                }


                                              }),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),

                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height:3,
                                        ),
                                        Text(LocaleKeys.Returntime.tr()),
                                        SizedBox(
                                          height: 40,
                                          width: 100,
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
                                              items: Provider.of<AlgorithmViewModel>(context).getGoTime()
                                                  .map((value) => DropdownMenuItem(
                                                value: value,
                                                child: Text(value),
                                              ))
                                                  .toList(),
                                              onChanged: (val) {

                                              }),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(onPressed: (){

                            }, icon: Icon(Icons.check_circle)),
                          )
                        ],
                      ),
                    ),
                  );
                }
                ),
          ),
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p28),
        child: Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.signupRoute);
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
