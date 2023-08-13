import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled/lang/locale_keys.g.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

class InfoDailyReservationView extends StatefulWidget {
  const InfoDailyReservationView({Key? key}) : super(key: key);

  @override
  _InfoDailyReservationViewState createState() => _InfoDailyReservationViewState();
}

class _InfoDailyReservationViewState extends State<InfoDailyReservationView> {
  final _forKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController seatsNumberController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(

      ),
      body:
      Card(
        elevation: 3,
        //color: ColorManager.profile,
        child: Stack(
            alignment: Alignment.center,
            children: [
    SingleChildScrollView(
                child: Form(
                  key: _forKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: AppPadding.p28,
                        left: AppPadding.p28,
                        bottom: AppPadding.p28),
                    child: Column(children: [
                      // Center(child: Image.asset(ImageAssets.logo4)),


                      Text("Enter your information",style: getBoldStyle(color: ColorManager.sidBarIcon,fontSize: FontSize.s18),),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p20, right: AppPadding.p20),
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.errorFirstName.tr();
                            } else {
                              // Provider.of<SignUpViewModel>(context,
                              // listen: false)
                              //     .setFirstName(value);
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: LocaleKeys.name.tr(),
                            labelText: LocaleKeys.name.tr(),
                            prefixIcon: Icon(
                              Icons.perm_identity,
                              color: ColorManager.kMainColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p20, right: AppPadding.p20),
                        child: TextFormField(
                          controller: phoneNumberController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.errorPhoneNumber.tr();
                            } else {
                              // Provider.of<SignUpViewModel>(context,
                              // listen: false)
                              //     .setFirstName(value);
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: LocaleKeys.ePhoneNumber.tr(),
                            labelText: LocaleKeys.ePhoneNumber.tr(),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: ColorManager.kMainColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: AppPadding.p28, right: AppPadding.p28),
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
                      //       Provider.of<SignUpViewModel>(context,
                      //           listen: false)
                      //           .setTransferPositionId(val!.id);
                      //     },
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p20, right: AppPadding.p20),
                        child: TextFormField(
                          controller: seatsNumberController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.seat.tr();
                            } else {
                              // Provider.of<SignUpViewModel>(context,
                              // listen: false)
                              //     .setFirstName(value);
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: LocaleKeys.seat.tr(),
                            labelText: LocaleKeys.seat.tr(),
                            prefixIcon: Icon(
                              Icons.event_seat,
                              color: ColorManager.kMainColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 90,),
                      ElevatedButton(onPressed: ()
                      {

                      }, child: Text(LocaleKeys.send.tr()))
                    ]),
                  ),
                ),
              ),]
        ),
      ),
    );
  }

// showDialogFunc(context,double h1,double w1,double h2,double w2) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return Center(
//         child: Material(
//           type: MaterialType.transparency,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//             ),
//             padding: EdgeInsets.all(15.sp),
//             height:h1,
//             width: w1,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(height: 5.h,),
//                 Container(
//                   width: h2,
//                   height: w2,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     image: DecorationImage(
//                         fit: BoxFit.contain,
//                         //image:Image.asset(ImageAsset),
//                         )
//                     ),
//                   ),
//                 ),
//
//               ],),
//
//           ),
//         ),
//
//       );
//     },
//   );
// }
}
