

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/page/profile/view_model/profile_view_model.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import 'package:sizer/sizer.dart';
import '../../../resources/font_manager.dart';

AppBar getAppBar(){
  return AppBar(

    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              //    Provider.of<LoginViewModel>(context,listen: false).isLog=false;
              //      Navigator.pop(context,Routes.afterSplashRoute);
            });
          },
          icon: SvgPicture.asset(
            ImageAssets.note,
            //     semanticsLabel: 'Acme Logo'
          ),
        ),
      ),
    ],
  );
}



class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileViewModel profileViewModel = instance<ProfileViewModel>();

  @override
  void initState() {
    Provider.of<ProfileViewModel>(context, listen: false).start();
    super.initState();
  }

  @override
  void dispose() {
    profileViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) =>
          Scaffold(
            body: contentWidget(),
          ),
    );
  }

  Widget contentWidget() {
    var profile = Provider.of<ProfileViewModel>(context, listen: false);
    var profile1 = Provider.of<ProfileViewModel>(context);
    TextEditingController _firstNameController =
    TextEditingController(text: profile1.getFirstName());
    TextEditingController _lastNameController =
    TextEditingController(text: profile1.getLastName());
    TextEditingController _phoneNumberController =
    TextEditingController(text: profile1.getPhone());
    TextEditingController _streetController =
    TextEditingController(text: profile1.getStreet());
    return Consumer<ProfileViewModel>(
      builder:(context, model, child) =>
       Sizer(
        builder: (context, orientation, deviceType) {
          return SafeArea(
            child: orientation == Orientation.portrait
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Provider.of<ProfileViewModel>(context)
                                  .getIm() !=
                                  null
                              //  profile1.getDownload()
                                  ? InkWell(
                                onTap: () async {
                                  await profile.updateImageFromGallory();
                                  await profile.updateImage();
                                },
                                child: Container(
                                  width: 28.w,
                                  height: 17.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      //color: Colors.grey[300],
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: FileImage(
                                              Provider.of<ProfileViewModel>(
                                                  context)
                                                  .getIm() ??
                                                  File("")))),
                                ),
                              )
                                  : InkWell(
                                onTap: () async {
                                  await profile.updateImageFromGallory();
                                  await profile.updateImage();
                                },
                                child: Container(
                                    width: 28.w,
                                    height: 17.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.add,
                                        size: AppSize.s50,
                                        color: Color(0xFFFFFFFF))),
                              )
                              //:profile1.getLocalPath()!=null?
                              ,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profile1.getName() ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeightManager.bold,
                                      fontSize: FontSize.s18),
                                ),
                                Text(
                                  profile1.getEmail(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyLarge,
                                ),
                                Text(
                                  profile1.getPhone(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                    icon:
                                    const Icon(Icons.keyboard_arrow_down),
                                    hint: Text(model.getProfileCity()),
                                    items: model
                                        .getCities()
                                        .map((e) => DropdownMenuItem(
                                      value: e.id,
                                      child: Text(" ${e.name}"),
                                    ))
                                        .toList(),
                                    onChanged: (val) {
                                      model.setCityId(val!);
                                    model
                                          .getAreasByIdCity(val);
                                    }),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                    icon:
                                    const Icon(Icons.keyboard_arrow_down),
                                    hint: Text(model.getProfileArea()),
                                    items: model
                                        .getAreas()
                                        .map((e) => DropdownMenuItem(
                                      value: e.id,
                                      child: Text(" ${e.name}"),
                                    ))
                                        .toList(),
                                    onChanged: (val) {
                                      model.setAreaId(val!);
                                    }),
                              ),

                            ],
                          ),
                        ),
                        Expanded(child:
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                                  icon:
                                  const Icon(Icons.keyboard_arrow_down),
                                  hint: Text(model.getProfileUni()),
                                  validator: (value) {
                                    if (value == null) {
                                      return StringsManager.universities;
                                    }
                                    return null;
                                  },
                                  items: model
                                      .getUniversities()
                                      .map((e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(" ${e.name}"),
                                  ))
                                      .toList(),
                                  onChanged: (val) {
                                    model.setUniversityId(val!);
                                  }),
                            ),
                          ],
                        )
                        )

                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person,
                              size: AppSize.s25,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(StringsManager.eFirstName,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodySmall),
                                SizedBox(
                                  width: 55.w,
                                  child: TextField(
                                    controller: _firstNameController,

                                    onChanged:(value)
                                    {
                                      Provider.of<ProfileViewModel>(context,listen: false)
                                          .updateFirstName(value);
                                    }

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person,
                              size: AppSize.s25,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(StringsManager.eLastName,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodySmall),
                                SizedBox(
                                  width: 55.w,
                                  child: TextField(
                                    controller: _lastNameController,
                                    onChanged: (value) {
                                      Provider.of<ProfileViewModel>(context,listen: false).updateLastName(value);
                                      _lastNameController.text = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.streetview,
                              size: AppSize.s25,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("StringsManager.street",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodySmall),
                                SizedBox(
                                  width: 55.w,
                                  child: TextField(
                                    controller: _streetController,
                                    onChanged: (value) {
                                      Provider.of<ProfileViewModel>(context,listen: false).updateStreet(value);

                                      _streetController.text = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.phone,
                              size: AppSize.s25,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(StringsManager.ePhoneNumber,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodySmall),
                                SizedBox(
                                  width: 55.w,
                                  child: TextField(
                                    controller: _phoneNumberController,
                                    onChanged: (value) {
                                      Provider.of<ProfileViewModel>(context,listen: false).updatePhone(value);

                                      _phoneNumberController.text = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p28,
                              horizontal: AppPadding.p50),
                          child: ElevatedButton(
                            onPressed: () {
                              profile.UpdateStudent();
                            },
                            child: Text(StringsManager.save),
                          ),
                        ),

                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
                : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 15.h,
                        padding: const EdgeInsets.all(AppPadding.p20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Provider.of<ProfileViewModel>(context)
                                  .getIm() !=
                                  null
                              //  profile1.getDownload()
                                  ? InkWell(
                                onTap: () async {
                                  await profile.updateImageFromGallory();
                                  await profile.updateImage();
                                },
                                child: Container(
                                  width: 40.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      //color: Colors.grey[300],
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: FileImage(
                                              Provider.of<ProfileViewModel>(
                                                  context)
                                                  .getIm() ??
                                                  File("")))),
                                ),
                              )
                                  : InkWell(
                                onTap: () async {
                                  await profile.updateImageFromGallory();
                                  await profile.updateImage();
                                },
                                child: Container(
                                    width: 40.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.add,
                                        size: AppSize.s50,
                                        color: Color(0xFFFFFFFF))),
                              )
                              //:profile1.getLocalPath()!=null?
                              ,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profile1.getName() ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeightManager.bold,
                                      fontSize: FontSize.s18),
                                ),
                                Text(
                                  profile1.getEmail(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyLarge,
                                ),
                                Text(
                                  profile1.getPhone(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSize.s45),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 3.h,
                                ),
                                // Text(StringsManager.profile,style: Theme.of(context).textTheme.labelLarge),
                                // const SizedBox(
                                //   height: 16,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      size: AppSize.s25,
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(StringsManager.eFirstName,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodySmall),
                                        SizedBox(
                                          width: 100.w,
                                          child: TextField(
                                            controller: _firstNameController,
                                            onChanged: (value) {
                                              _firstNameController.text = value;
                                              Provider.of<ProfileViewModel>(context).updateFirstName(value);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      size: AppSize.s25,
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(StringsManager.eLastName,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodySmall),
                                        SizedBox(
                                          width: 100.w,
                                          child: TextField(
                                            controller: _lastNameController,
                                            onChanged: (value) {
                                              Provider.of<ProfileViewModel>(context,listen: false).updateLastName(value);
                                              _lastNameController.text = value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.streetview,
                                      size: AppSize.s25,
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("StringsManager.street",
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodySmall),
                                        SizedBox(
                                          width: 100.w,
                                          child: TextField(
                                            controller: _streetController,
                                            onChanged: (value) {
                                              Provider.of<ProfileViewModel>(context,listen: false).updateStreet(value);
                                              _streetController.text = value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      size: AppSize.s25,
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(StringsManager.ePhoneNumber,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodySmall),
                                        SizedBox(
                                          width: 100.w,
                                          child: TextField(
                                            controller: _phoneNumberController,
                                            onChanged: (value) {
                                              Provider.of<ProfileViewModel>(context,listen: false).updatePhone(value);

                                              _phoneNumberController.text = value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("StringsManager.street",
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodySmall),
                                        SizedBox(
                                          width: 100.w,
                                          child: TextField(
                                            controller: _streetController,
                                            onSubmitted: (value) {
                                              _streetController.text = value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppPadding.p28,
                                      horizontal: AppPadding.p28),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      profile.UpdateStudent();
                                    },
                                    child: Text(StringsManager.save),
                                  ),
                                ),

                                SizedBox(
                                  height: 3.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                                  icon:
                                  const Icon(Icons.keyboard_arrow_down),
                                  hint: Text(model.getProfileCity()),
                                  items: model
                                      .getCities()
                                      .map((e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(" ${e.name}"),
                                  ))
                                      .toList(),
                                  onChanged: (val) {
                                    model.setCityId(val!);
                                    model
                                        .getAreasByIdCity(val);
                                  }),
                            ),
                            Expanded(
                              child: DropdownButtonFormField(
                                  icon:
                                  const Icon(Icons.keyboard_arrow_down),
                                  hint: Text(model.getProfileArea()),
                                  items: model
                                      .getAreas()
                                      .map((e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(" ${e.name}"),
                                  ))
                                      .toList(),
                                  onChanged: (val) {
                                    model.setAreaId(val!);
                                  }),
                            ),

                          ],
                        ),
                      ),
                      Expanded(child:
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField(
                                icon:
                                const Icon(Icons.keyboard_arrow_down),
                                hint: Text(model.getProfileUni()),
                                validator: (value) {
                                  if (value == null) {
                                    return StringsManager.universities;
                                  }
                                  return null;
                                },
                                items: model
                                    .getUniversities()
                                    .map((e) => DropdownMenuItem(
                                  value: e.id,
                                  child: Text(" ${e.name}"),
                                ))
                                    .toList(),
                                onChanged: (val) {
                                  model.setUniversityId(val!);
                                }),
                          ),
                        ],
                      )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


