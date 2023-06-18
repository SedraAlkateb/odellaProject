// import 'dart:io';
// import 'package:badges/badges.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import 'package:untitled/app/di.dart';
// import 'package:untitled/lang/locale_keys.g.dart';
// import 'package:untitled/presentation/not_viewmodel.dart';
// import 'package:untitled/presentation/page_superviser/drawer/view/drawer.dart';
// import 'package:untitled/presentation/page_superviser/profile/view_model/supervisor_profile_viewmodel.dart';
// import 'package:untitled/presentation/resources/color_manager.dart';
// import 'package:untitled/presentation/resources/font_manager.dart';
// import 'package:untitled/presentation/resources/strings_manager.dart';
// import 'package:untitled/presentation/resources/style_manage.dart';
// import 'package:untitled/presentation/resources/values_manager.dart';
//
//
// class SupervisorProfileView1 extends StatefulWidget {
//   const SupervisorProfileView1({Key? key}) : super(key: key);
//
//   @override
//   _SupervisorProfileView1State createState() => _SupervisorProfileView1State();
// }
//
// class _SupervisorProfileView1State extends State<SupervisorProfileView1> {
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
//     return Sizer(
//       builder: (context, orientation, deviceType) {
//         return Consumer<SupervisorProfileViewModel>(
//           builder: (context, model, child) =>
//               SafeArea(
//                 child: orientation == Orientation.portrait
//                     ? Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: Padding(
//                         padding: const EdgeInsets.all(AppPadding.p20),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   child: model
//                                       .getIm() !=
//                                       null
//                                       ? InkWell(
//                                     onTap: () async {
//                                       await model.updateImageFromGallory();
//                                       await model.updateImage();
//                                     },
//                                     child: Container(
//                                       width: 28.w,
//                                       height: 17.h,
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           //color: Colors.grey[300],
//                                           image: DecorationImage(
//                                               fit: BoxFit.contain,
//                                               image: FileImage(
//                                                   Provider.of<SupervisorProfileViewModel>(
//                                                       context)
//                                                       .getIm() ??
//                                                       File("")))),
//                                     ),
//                                   )
//                                       : InkWell(
//                                     onTap: () async {
//                                       await model.updateImageFromGallory();
//                                       await model.updateImage();
//                                     },
//                                     child: Container(
//                                         width: 28.w,
//                                         height: 17.h,
//                                         decoration: BoxDecoration(
//                                           color: Colors.grey[300],
//                                           shape: BoxShape.circle,
//                                         ),
//                                         child: const Icon(Icons.add,
//                                             size: AppSize.s50,
//                                             color: Color(0xFFFFFFFF))),
//                                   )
//                                   ,
//                                 ),
//                                 const SizedBox(
//                                   width: 25,
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       model.getName() ?? '',
//                                       style: const TextStyle(
//                                           fontWeight: FontWeightManager.bold,
//                                           fontSize: FontSize.s18),
//                                     ),
//                                     Text(
//                                       model.getEmail(),
//                                       style: Theme
//                                           .of(context)
//                                           .textTheme
//                                           .bodyLarge,
//                                     ),
//                                     Text(
//                                       model.getPhone(),
//                                       style: Theme
//                                           .of(context)
//                                           .textTheme
//                                           .bodyLarge,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 4.h,),
//
//                             SizedBox(height: 4.h,),
//                             Expanded(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: DropdownButtonFormField(
//                                         icon:
//                                         const Icon(Icons.keyboard_arrow_down),
//                                         hint: Text(model.getProfileCity()),
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
//                                   Expanded(
//                                     child: DropdownButtonFormField(
//                                         icon:
//                                         const Icon(Icons.keyboard_arrow_down),
//                                         hint: Text(model.getProfileArea()),
//
//                                         items: model
//                                             .getAreas()
//                                             .map((e) => DropdownMenuItem(
//                                           value: e.id,
//                                           child: Text(" ${e.name}"),
//                                         ))
//                                             .toList(),
//                                         onChanged: (val) {
//                                           print(val);
//                                           model.setAreaId(val!);
//                                         }),
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               width: double.infinity,
//                               height: AppSize.s1_5,
//                               color: Colors.grey[400],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     Expanded(
//                       flex: 1,
//                       child: SingleChildScrollView(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Icon(
//                                   Icons.person,
//                                   size: AppSize.s25,
//                                 ),
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(LocaleKeys.eFirstName.tr(),
//                                         style: Theme
//                                             .of(context)
//                                             .textTheme
//                                             .bodySmall),
//                                     SizedBox(
//                                       width: 55.w,
//                                       child: TextField(
//                                         controller: _firstNameController,
//                                         onSubmitted: (value) {
//                                           _firstNameController.text = value;
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Icon(
//                                   Icons.person,
//                                   size: AppSize.s25,
//                                 ),
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(LocaleKeys.eLastName.tr(),
//                                         style: Theme
//                                             .of(context)
//                                             .textTheme
//                                             .bodySmall),
//                                     SizedBox(
//                                       width: 55.w,
//                                       child: TextField(
//                                         controller: _lastNameController,
//                                         onSubmitted: (value) {
//                                           _lastNameController.text = value;
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Icon(
//                                   Icons.phone,
//                                   size: AppSize.s25,
//                                 ),
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(LocaleKeys.ePhoneNumber.tr(),
//                                         style: Theme
//                                             .of(context)
//                                             .textTheme
//                                             .bodySmall),
//                                     SizedBox(
//                                       width: 55.w,
//                                       child: TextField(
//                                         controller: _phoneNumberController,
//                                         onSubmitted: (value) {
//                                           _phoneNumberController.text = value;
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 const Icon(
//                                   Icons.streetview,
//                                   size: AppSize.s25,
//                                 ),
//                                 SizedBox(
//                                   width: 12.w,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text("StringsManager.street",
//                                         style: Theme
//                                             .of(context)
//                                             .textTheme
//                                             .bodySmall),
//                                     SizedBox(
//                                       width: 55.w,
//                                       child: TextField(
//                                         controller: _streetController,
//                                         onSubmitted: (value) {
//                                           _streetController.text = value;
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 3.h,
//                             ),
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: AppPadding.p28,
//                                   horizontal: AppPadding.p50),
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   model.updateSupervisor();
//                                 },
//                                 child: Text(LocaleKeys.save.tr()),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//                     : Row(
//                   children: [
//                     Expanded(
//                       flex: 3,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             height: 15.h,
//                             padding: const EdgeInsets.all(AppPadding.p20),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   child: model
//                                       .getIm() !=
//                                       null
//                                   //  model.getDownload()
//                                       ? InkWell(
//                                     onTap: () async {
//                                       await model.updateImageFromGallory();
//                                       await model.updateImage();
//                                     },
//                                     child: Container(
//                                       width: 40.w,
//                                       height: 20.h,
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           //color: Colors.grey[300],
//                                           image: DecorationImage(
//                                               fit: BoxFit.contain,
//                                               image: FileImage(
//                                                   Provider.of<SupervisorProfileViewModel>(
//                                                       context)
//                                                       .getIm() ??
//                                                       File("")))),
//                                     ),
//                                   )
//                                       : InkWell(
//                                     onTap: () async {
//                                       await model.updateImageFromGallory();
//                                       await model.updateImage();
//                                     },
//                                     child: Container(
//                                         width: 40.w,
//                                         height: 20.h,
//                                         decoration: BoxDecoration(
//                                           color: Colors.grey[300],
//                                           shape: BoxShape.circle,
//                                         ),
//                                         child: const Icon(Icons.add,
//                                             size: AppSize.s50,
//                                             color: Color(0xFFFFFFFF))),
//                                   )
//                                   //:model.getLocalPath()!=null?
//                                   ,
//                                 ),
//                                 SizedBox(
//                                   width: 10.w,
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       model.getName() ?? '',
//                                       style: const TextStyle(
//                                           fontWeight: FontWeightManager.bold,
//                                           fontSize: FontSize.s18),
//                                     ),
//                                     Text(
//                                       model.getEmail(),
//                                       style: Theme
//                                           .of(context)
//                                           .textTheme
//                                           .bodyLarge,
//                                     ),
//                                     Text(
//                                       model.getPhone(),
//                                       style: Theme
//                                           .of(context)
//                                           .textTheme
//                                           .bodyLarge,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: SingleChildScrollView(
//
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: AppSize.s45),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SizedBox(
//                                       height: 3.h,
//                                     ),
//                                     // Text(StringsManager.profile,style: Theme.of(context).textTheme.labelLarge),
//                                     // const SizedBox(
//                                     //   height: 16,
//                                     // ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         const Icon(
//                                           Icons.person,
//                                           size: AppSize.s25,
//                                         ),
//                                         SizedBox(
//                                           width: 12.w,
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             Text(LocaleKeys.eFirstName.tr(),
//                                                 style: Theme
//                                                     .of(context)
//                                                     .textTheme
//                                                     .bodySmall),
//                                             SizedBox(
//                                               width: 100.w,
//                                               child: TextField(
//                                                 controller: _firstNameController,
//                                                 onSubmitted: (value) {
//                                                   _firstNameController.text = value;
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 3.h,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         const Icon(
//                                           Icons.person,
//                                           size: AppSize.s25,
//                                         ),
//                                         SizedBox(
//                                           width: 12.w,
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             Text(LocaleKeys.eLastName.tr(),
//                                                 style: Theme
//                                                     .of(context)
//                                                     .textTheme
//                                                     .bodySmall),
//                                             SizedBox(
//                                               width: 100.w,
//                                               child: TextField(
//                                                 controller: _lastNameController,
//                                                 onSubmitted: (value) {
//                                                   _lastNameController.text = value;
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 3.h,
//                                     ),
//                                     SizedBox(
//                                       height: 3.h,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         const Icon(
//                                           Icons.phone,
//                                           size: AppSize.s25,
//                                         ),
//                                         SizedBox(
//                                           width: 12.w,
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             Text(LocaleKeys.ePhoneNumber.tr(),
//                                                 style: Theme
//                                                     .of(context)
//                                                     .textTheme
//                                                     .bodySmall),
//                                             SizedBox(
//                                               width: 100.w,
//                                               child: TextField(
//                                                 controller: _phoneNumberController,
//                                                 onSubmitted: (value) {
//                                                   _phoneNumberController.text = value;
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 3.h,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         const Icon(
//                                           Icons.streetview,
//                                           size: AppSize.s25,
//                                         ),
//                                         SizedBox(
//                                           width: 12.w,
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             Text("StringsManager.street",
//                                                 style: Theme
//                                                     .of(context)
//                                                     .textTheme
//                                                     .bodySmall),
//                                             SizedBox(
//                                               width: 100.w,
//                                               child: TextField(
//                                                 controller: _streetController,
//                                                 onSubmitted: (value) {
//                                                   _streetController.text = value;
//                                                 },
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 3.h,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: AppPadding.p28,
//                                           horizontal: AppPadding.p28),
//                                       child: ElevatedButton(
//                                         onPressed: () {
//                                           model.updateSupervisor();
//                                         },
//                                         child: Text(LocaleKeys.save.tr()),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 3.h,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//
//                             child: DropdownButtonFormField(
//                                 icon:
//                                 const Icon(Icons.keyboard_arrow_down),
//                                 hint: Text(LocaleKeys.cities.tr()),
//
//                                 items: model
//                                     .getCities()
//                                     .map((e) => DropdownMenuItem(
//                                   value: e.id,
//                                   child: Text(" ${e.name}"),
//                                 ))
//                                     .toList(),
//                                 onChanged: (val) {
//                                   Provider.of<SupervisorProfileViewModel>(context,
//                                       listen: false)
//                                       .setCityId(val!);
//                                   Provider.of<SupervisorProfileViewModel>(context,
//                                       listen: false)
//                                       .getAreasByIdCity(val);
//                                 }),
//                           ),
//                           SizedBox(height: 2.h,),
//                           DropdownButton(
//                             value: dropdownPosition,
//                             items: <String>['p1', 'p2', 'p3', 'p4']
//                                 .map<DropdownMenuItem<String>>((
//                                 String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: SizedBox(
//                                   width: 14.w,
//                                   child: Text(
//                                     value,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(fontSize: AppSize.s15),
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 dropdownPosition = newValue!;
//                               });
//                             },),
//                           DropdownButton(
//                             value: dropdownUniversity,
//                             items: <String>['u1', 'u2', 'u3', 'u4']
//                                 .map<DropdownMenuItem<String>>((
//                                 String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: SizedBox(
//                                   width: 14.w,
//                                   child: Text(
//                                     value,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(fontSize: AppSize.s15),
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 dropdownUniversity = newValue!;
//                               });
//                             },),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//         );
//       },
//     );
//   }
// }
//
