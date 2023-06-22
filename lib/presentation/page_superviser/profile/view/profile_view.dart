//
//
// import 'dart:io';
//
// import 'package:badges/badges.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import 'package:untitled/app/di.dart';
// import 'package:untitled/lang/locale_keys.g.dart';
// import 'package:untitled/presentation/page_superviser/profile/view_model/supervisor_profile_viewmodel.dart';
// import 'package:untitled/presentation/resources/assets_manager.dart';
// import 'package:untitled/presentation/resources/color_manager.dart';
// import 'package:untitled/presentation/resources/strings_manager.dart';
// import 'package:untitled/presentation/resources/values_manager.dart';
//
// import '../../../not_viewmodel.dart';
// import '../../../resources/font_manager.dart';
// import '../../../resources/routes_manager.dart';
// import '../../../resources/style_manage.dart';
// import '../../drawer/view/drawer.dart';
// class SupervisorProfileView extends StatefulWidget {
//   const SupervisorProfileView({Key? key}) : super(key: key);
//
//   @override
//   _SupervisorProfileViewState createState() => _SupervisorProfileViewState();
// }
//
// class _SupervisorProfileViewState extends State<SupervisorProfileView> {
//   SupervisorProfileViewModel profileViewModel =
//   instance<SupervisorProfileViewModel>();
//
//   String dropdownTransportationLine = 't1';
//   String dropdownPosition = 'p1';
//   String dropdownUniversity = 'u1';
//
//   @override
//   void initState() {
//     Provider.of<SupervisorProfileViewModel>(context, listen: false).start();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     profileViewModel.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(
//       builder: (context, orientation, deviceType) =>
//           Scaffold(
//             appBar: AppBar(
//               actions: [
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Badge(
//                     badgeContent: Text("${ Provider.of<Not>(context).getCount()}",style: TextStyle(color: Colors.white),),
//
//                     child: Icon(Icons.notifications,size: AppSize.s30),
//                     badgeAnimation: BadgeAnimation.fade(animationDuration: Duration(milliseconds:250 )),
//                   ),
//                 ),
//               ],
//               title: Text(LocaleKeys.profile.tr(),
//                   style: getBoldStyle(
//                       color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
//
//             ),
//             drawer:  DrawerSupervisorView(),
//
//             body: contentWidget(),
//           ),
//     );
//   }
//
//   Widget contentWidget() {
//     //var profile = Provider.of<SupervisorProfileViewModel>(context, listen: false);
//     var profile1 = Provider.of<SupervisorProfileViewModel>(context);
//     TextEditingController _firstNameController =
//     TextEditingController(text: profile1.getFirstName());
//     TextEditingController _streetController =
//     TextEditingController(text: profile1.getStreet());
//     TextEditingController _lastNameController =
//     TextEditingController(text: profile1.getLastName());
//     TextEditingController _emailController =
//     TextEditingController(text: profile1.getEmail());
//     TextEditingController _phoneNumberController =
//     TextEditingController(text: profile1.getPhone());
//
//     return Sizer(
//         builder: (context, orientation, deviceType) {
//           return Consumer<SupervisorProfileViewModel>(
//             builder: (context, model, child) =>
//                 SafeArea(
//                   child: orientation == Orientation.portrait
//                       ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: Padding(
//                           padding: const EdgeInsets.all(AppPadding.p20),
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     child: model
//                                         .getIm() !=
//                                         null
//                                         ? InkWell(
//                                       onTap: () async {
//                                         await model.updateImageFromGallory();
//                                         await model.updateImage();
//                                       },
//                                       child: Container(
//                                         width: 28.w,
//                                         height: 17.h,
//                                         decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             //color: Colors.grey[300],
//                                             image: DecorationImage(
//                                                 fit: BoxFit.contain,
//                                                 image: FileImage(
//                                                     Provider.of<SupervisorProfileViewModel>(context).getIm()?? File("")
//                                                 ))),
//                                       ),
//                                     )
//                                         : InkWell(
//                                       onTap: () async {
//                                         await model.updateImageFromGallory();
//                                         await model.updateImage();
//                                       },
//                                       child: Container(
//                                           width: 28.w,
//                                           height: 17.h,
//                                           decoration: BoxDecoration(
//                                             color: Colors.grey[300],
//                                             shape: BoxShape.circle,
//                                           ),
//                                           child: const Icon(Icons.add,
//                                               size: AppSize.s50,
//                                               color: Color(0xFFFFFFFF))),
//                                     )
//                                     //:profile1.getLocalPath()!=null?
//                                     ,
//                                   ),
//                                   const SizedBox(
//                                     width: 25,
//                                   ),
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         model.getName() ?? '',
//                                         style: const TextStyle(
//                                             fontWeight: FontWeightManager.bold,
//                                             fontSize: FontSize.s18),
//                                       ),
//                                       Text(
//                                         model.getEmail(),
//                                         style: Theme
//                                             .of(context)
//                                             .textTheme
//                                             .bodyLarge,
//                                       ),
//                                       Text(
//                                         model.getPhone(),
//                                         style: Theme
//                                             .of(context)
//                                             .textTheme
//                                             .bodyLarge,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 2.h,),
//                               Divider(height: 3.h,color: ColorManager.sidBar,thickness: 2,),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child:SingleChildScrollView(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 height: 5.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   const Icon(
//                                     Icons.person,
//                                     size: AppSize.s25,
//                                   ),
//                                   SizedBox(
//                                     width: 6.w,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(LocaleKeys.eFirstName.tr(),
//                                           style: Theme
//                                               .of(context)
//                                               .textTheme
//                                               .bodySmall),
//                                       SizedBox(
//                                         width: 55.w,
//                                         child: TextField(
//                                           controller: _firstNameController,
//                                           onSubmitted: (value) {
//                                             _firstNameController.text = value;
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 5.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   const Icon(
//                                     Icons.person,
//                                     size: AppSize.s25,
//                                   ),
//                                   SizedBox(
//                                     width: 6.w,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(LocaleKeys.eLastName.tr(),
//                                           style: Theme
//                                               .of(context)
//                                               .textTheme
//                                               .bodySmall),
//                                       SizedBox(
//                                         width: 55.w,
//                                         child: TextField(
//                                           controller: _lastNameController,
//                                           onSubmitted: (value) {
//                                             _lastNameController.text = value;
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//
//                               SizedBox(
//                                 height: 5.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   const Icon(
//                                     Icons.phone,
//                                     size: AppSize.s25,
//                                   ),
//                                   SizedBox(
//                                     width: 6.w,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(LocaleKeys.ePhoneNumber.tr(),
//                                           style: Theme
//                                               .of(context)
//                                               .textTheme
//                                               .bodySmall),
//                                       SizedBox(
//                                         width: 55.w,
//                                         child: TextField(
//                                           controller: _phoneNumberController,
//                                           onSubmitted: (value) {
//                                             _phoneNumberController.text = value;
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 5.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   const Icon(
//                                     Icons.streetview,
//                                     size: AppSize.s25,
//                                   ),
//                                   SizedBox(
//                                     width: 12.w,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text("LocaleKeys.street",
//                                           style: Theme
//                                               .of(context)
//                                               .textTheme
//                                               .bodySmall),
//                                       SizedBox(
//                                         width: 55.w,
//                                         child: TextField(
//                                           controller: _streetController,
//                                           onSubmitted: (value) {
//                                             _streetController.text = value;
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 3.h,
//                               ),
//                               SizedBox(
//                                 height: 8.h,
//                               ),
//                               SizedBox(
//                                 height: 14.h,
//                                 width: 70.w,
//                                 child:DropdownButtonFormField(
//                                     icon:
//                                     const Icon(Icons.keyboard_arrow_down),
//                                     hint: Text(model.getProfileCity()),
//                                     items: model
//                                         .getCities()
//                                         .map((e) => DropdownMenuItem(
//                                       value: e.id,
//                                       child: Text(" ${e.name}"),
//                                     ))
//                                         .toList(),
//                                     onChanged: (val) {
//                                       Provider.of<SupervisorProfileViewModel>(context,
//                                           listen: false)
//                                           .setCityId(val!);
//                                       Provider.of<SupervisorProfileViewModel>(context,
//                                           listen: false)
//                                           .getAreasByIdCity(val);
//                                     }),
//                               ),
//
//                               SizedBox(
//                                 height: 14.h,
//                                 width: 70.w,
//                                 child:DropdownButtonFormField(
//                                     icon:
//                                     const Icon(Icons.keyboard_arrow_down),
//                                     hint: Text(model.getProfileArea()),
//
//                                     items: model
//                                         .getAreas()
//                                         .map((e) => DropdownMenuItem(
//                                       value: e.id,
//                                       child: Text(" ${e.name}"),
//                                     ))
//                                         .toList(),
//                                     onChanged: (val) {
//                                       print(val);
//                                       model.setAreaId(val!);
//                                     }),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: AppPadding.p28,
//                                     horizontal: AppPadding.p50),
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     model.updateSupervisor();
//                                   },
//                                   child: Text(LocaleKeys.save.tr()),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 5.h,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                       : Row(
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: 15.h,
//                               padding: const EdgeInsets.all(AppPadding.p20),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     child: Provider.of<SupervisorProfileViewModel>(context)
//                                         .getIm() !=
//                                         null
//                                     //  profile1.getDownload()
//                                         ? InkWell(
//                                       onTap: () async {
//                                         await model.updateImageFromGallory();
//                                         await model.updateImage();
//                                       },
//                                       child: Container(
//                                         width: 40.w,
//                                         height: 20.h,
//                                         decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             //color: Colors.grey[300],
//                                             image: DecorationImage(
//                                                 fit: BoxFit.contain,
//                                                 image: FileImage(
//                                                     Provider.of<SupervisorProfileViewModel>(
//                                                         context)
//                                                         .getIm() ??
//                                                         File("")))),
//                                       ),
//                                     )
//                                         : InkWell(
//                                       onTap: () async {
//                                         await model.updateImageFromGallory();
//                                         await model.updateImage();
//                                       },
//                                       child: Container(
//                                           width: 40.w,
//                                           height: 20.h,
//                                           decoration: BoxDecoration(
//                                             color: Colors.grey[300],
//                                             shape: BoxShape.circle,
//                                           ),
//                                           child: const Icon(Icons.add,
//                                               size: AppSize.s50,
//                                               color: Color(0xFFFFFFFF))),
//                                     )
//                                     //:profile1.getLocalPath()!=null?
//                                     ,
//                                   ),
//                                   SizedBox(
//                                     width: 10.w,
//                                   ),
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                           profile1.getName()??"",
//                                           style:Theme.of(context).textTheme.bodyLarge
//                                       ),
//                                       Text(
//                                           profile1.getEmail(),
//                                           style:Theme.of(context).textTheme.bodyLarge
//                                       ),
//                                       Text(
//                                           profile1.getPhone(),
//                                           style:Theme.of(context).textTheme.bodyLarge
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               width: 200.w,
//                               child: Divider(height: 2.h,
//                                 color: ColorManager.sidBar ,
//                                 thickness: 2,),
//                             ),
//                             Expanded(
//                               child: SingleChildScrollView(
//
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: AppSize.s45),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       // Text(LocaleKeys.profile,style: Theme.of(context).textTheme.labelLarge),
//                                       // const SizedBox(
//                                       //   height: 16,
//                                       // ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           const Icon(
//                                             Icons.person,
//                                             size: AppSize.s25,
//                                           ),
//                                           SizedBox(
//                                             width: 12.w,
//                                           ),
//                                           Column(
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Text(LocaleKeys.eFirstName.tr(),
//                                                   style: Theme
//                                                       .of(context)
//                                                       .textTheme
//                                                       .bodySmall),
//                                               SizedBox(
//                                                 width: 100.w,
//                                                 child: TextField(
//                                                   controller: _firstNameController,
//                                                   onSubmitted: (value) {
//                                                     _firstNameController.text = value;
//                                                   },
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           const Icon(
//                                             Icons.person,
//                                             size: AppSize.s25,
//                                           ),
//                                           SizedBox(
//                                             width: 12.w,
//                                           ),
//                                           Column(
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Text(LocaleKeys.eLastName.tr(),
//                                                   style: Theme
//                                                       .of(context)
//                                                       .textTheme
//                                                       .bodySmall),
//                                               SizedBox(
//                                                 width: 100.w,
//                                                 child: TextField(
//                                                   controller: _lastNameController,
//                                                   onSubmitted: (value) {
//                                                     _lastNameController.text = value;
//                                                   },
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           const Icon(
//                                             Icons.phone,
//                                             size: AppSize.s25,
//                                           ),
//                                           SizedBox(
//                                             width: 12.w,
//                                           ),
//                                           Column(
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Text(LocaleKeys.ePhoneNumber.tr(),
//                                                   style: Theme
//                                                       .of(context)
//                                                       .textTheme
//                                                       .bodySmall),
//                                               SizedBox(
//                                                 width: 100.w,
//                                                 child: TextField(
//                                                   controller: _phoneNumberController,
//                                                   onSubmitted: (value) {
//                                                     _phoneNumberController.text = value;
//                                                   },
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           const Icon(
//                                             Icons.streetview,
//                                             size: AppSize.s25,
//                                           ),
//                                           SizedBox(
//                                             width: 12.w,
//                                           ),
//                                           Column(
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Text("LocaleKeys.street",
//                                                   style: Theme
//                                                       .of(context)
//                                                       .textTheme
//                                                       .bodySmall),
//                                               SizedBox(
//                                                 width: 100.w,
//                                                 child: TextField(
//                                                   controller: _streetController,
//                                                   onSubmitted: (value) {
//                                                     _streetController.text = value;
//                                                   },
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             vertical: AppPadding.p28,
//                                             horizontal: AppPadding.p28),
//                                         child: ElevatedButton(
//                                           onPressed: () {
//                                             model.updateSupervisor();
//                                           },
//                                           child: Text(LocaleKeys.save.tr()),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Row(
//                                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(
//                                     width: 120.w,
//                                     height: 10.h,
//                                     child: DropdownButtonFormField(
//                                         icon:
//                                         const Icon(Icons.keyboard_arrow_down),
//                                         hint: Text(LocaleKeys.cities.tr()),
//
//                                         items: model
//                                             .getCities()
//                                             .map((e) => DropdownMenuItem(
//                                           value: e.id,
//                                           child: Text(" ${e.name}"),
//                                         ))
//                                             .toList(),
//                                         onChanged: (val) {
//                                           Provider.of<SupervisorProfileViewModel>(context,
//                                               listen: false)
//                                               .setCityId(val!);
//                                           Provider.of<SupervisorProfileViewModel>(context,
//                                               listen: false)
//                                               .getAreasByIdCity(val);
//                                         }),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(
//                                     width: 120.w,
//                                     height: 10.h,
//                                     child: DropdownButton(
//                                       value: dropdownPosition,
//                                       items: <String>['p1', 'p2', 'p3', 'p4']
//                                           .map<DropdownMenuItem<String>>((
//                                           String value) {
//                                         return DropdownMenuItem<String>(
//                                           value: value,
//                                           child: SizedBox(
//                                             width: 14.w,
//                                             child: Text(
//                                               value,
//                                               overflow: TextOverflow.ellipsis,
//                                               style: const TextStyle(fontSize: AppSize.s15),
//                                             ),
//                                           ),
//                                         );
//                                       }).toList(),
//                                       onChanged: (String? newValue) {
//                                         setState(() {
//                                           dropdownPosition = newValue!;
//                                         });
//                                       },),
//                                   ),
//                                 ],
//                               ),
//
//                             ],
//                           ),
//                         ),
//
//                       ),
//                     ],
//                   ),
//                 ),
//
//           );
//         }
//     );
//   }
//
// }
//
// /*
//  StreamBuilder<FlowState>(
//           stream:
//           Provider.of<ProfileViewModel>(context, listen: false).outputState,
//           builder: (context, snapshot) {
//             return snapshot.data?.getScreenWidget( context, contentWidget(), () {
//               Provider.of<ProfileViewModel>(context, listen: false).start();
//             }) ??
//                 contentWidget();
//           })
//  */
