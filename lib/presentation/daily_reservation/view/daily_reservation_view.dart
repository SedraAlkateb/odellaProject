
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import '../../../lang/locale_keys.g.dart';
import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';
import '../../signup/view_model/signup_view_model.dart';

class DailyReservationView extends StatefulWidget {
  @override
  _DailyReservationState createState() => _DailyReservationState();

}

class _DailyReservationState extends State<DailyReservationView> {
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController positionController=TextEditingController();
  TextEditingController seatNumberController=TextEditingController();
  final globalKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   // var _register1 = Provider.of<SignUpViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily reservation",style: Theme
            .of(context)
            .textTheme.bodyLarge,),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: globalKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              //height: size.height,
              height:500,
              child: Stack(

                // color: Colors.grey.shade300,
                // height: 400,
                children:[
                  Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                      "assets/images/top1.png",
                      width: size.width
                  ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                        "assets/images/bottom2.png",
                        width: size.width
                    ),
                  ),
                  Column(
                  children: [
                    SizedBox(height:70,),
                    Center(child: Text("Enjoy your trip",style: getBoldStyle(color: ColorManager.sidBar,fontSize: FontSize.s18),)),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    //SizedBox(height: 80,),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppPadding.p28,
                        right: AppPadding.p28,
                        bottom: AppPadding.p28,
                      ),
                      child: TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "LocaleKeys.errorFirstName.tr()";
                          } else {
                            // Provider.of<SignUpViewModel>(context,
                            //     listen: false)
                            //     .setFirstName(value);
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          labelText: "Name",
                          prefixIcon: Icon(
                            Icons.perm_identity,
                            color: ColorManager.kMainColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppPadding.p28,
                        right: AppPadding.p28,
                        bottom: AppPadding.p28,
                      ),
                      child: TextFormField(
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "LocaleKeys.errorFirstName.tr()";
                          } else {
                            // Provider.of<SignUpViewModel>(context,
                            //     listen: false)
                            //     .setFirstName(value);
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          labelText: "Phone Number",
                          prefixIcon: Icon(
                            Icons.phone,
                            color: ColorManager.kMainColor,
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //     left: AppPadding.p28,
                    //     right: AppPadding.p28,
                    //     bottom: AppPadding.p28,
                    //   ),
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
                    //       // Provider.of<SignUpViewModel>(context,
                    //       //     listen: false)
                    //       //     .setTransferPositionId(val!.id);
                    //     },
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppPadding.p28,
                        right: AppPadding.p28,
                        bottom: AppPadding.p28,
                      ),
                      child: TextFormField(
                        controller: seatNumberController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "LocaleKeys.errorFirstName.tr()";
                          } else {
                            // Provider.of<SignUpViewModel>(context,
                            //     listen: false)
                            //     .setFirstName(value);
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Seats number",
                          labelText: "Seats number",
                          prefixIcon: Icon(
                            Icons.event_seat,
                            color: ColorManager.kMainColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
