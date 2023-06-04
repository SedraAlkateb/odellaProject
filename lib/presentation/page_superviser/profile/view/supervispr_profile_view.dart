

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/page_superviser/profile/view_model/supervisor_profile_viewmodel.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
class SupervisorProfileView extends StatefulWidget {
  const SupervisorProfileView({Key? key}) : super(key: key);

  @override
  _SupervisorProfileViewState createState() => _SupervisorProfileViewState();
}

class _SupervisorProfileViewState extends State<SupervisorProfileView> {
  TextEditingController _p1controoler = TextEditingController();
  TextEditingController _p2controoler = TextEditingController();
  TextEditingController _p3controoler = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  SupervisorProfileViewModel  profileViewModel =instance<SupervisorProfileViewModel>();

  @override
  void initState() {
    Provider.of<SupervisorProfileViewModel>(context,listen: false).start();
    super.initState();
  }
  @override
  void dispose() {
    profileViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:contentWidget()
    );

  }
  Widget contentWidget(){
    var profile = Provider.of<SupervisorProfileViewModel>(context, listen: false);
    var profile1 = Provider.of<SupervisorProfileViewModel>(context);
    TextEditingController _firstNameController =
    TextEditingController(text: profile1.getFirstName());
    TextEditingController _lastNameController =
    TextEditingController(text: profile1.getLastName() );
    TextEditingController _emailController =
    TextEditingController(text: profile1.getEmail() );
    TextEditingController _phoneNumberController =
    TextEditingController(text: profile1.getPhone());
    return Container(
      color: ColorManager.icon,
      width: double.infinity,
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Expanded(
            child: Column(
              children: [
                Container(
                  color: ColorManager.icon,
                  width: double.infinity,
                  //    height: double.maxFinite,
                  child:
                  Provider.of<SupervisorProfileViewModel>(context).getIm() != null
                  //  profile1.getDownload()
                      ?Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppPadding.p50),
                      child: InkWell(
                        onTap: ()async {
                          await    profile.updateImageFromGallory();
                          await   profile.updateImage();
                        },
                        child:Container(
                          width: 160.0,
                          height: 160.0,
                          decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image:
                                  FileImage(
                                      Provider.of<SupervisorProfileViewModel>(context).getIm()?? File("")
                                  )
                              )
                          ),


                        ),

                      )
                  )
                      : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppPadding.p50),
                    child: InkWell(
                      onTap: ()async{
                        await profile.updateImageFromGallory();
                        await  profile.updateImage();
                      },
                      child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.add,
                              size: 50, color: Color(0xFFFFFFFF))),
                    ),
                  )
                  //:profile1.getLocalPath()!=null?

                  ,
                ),
                Text(
                    profile1.getName()??"",
                    style:Theme.of(context).textTheme.bodyLarge
                ),
                Text(
                    profile1.getEmail(),
                    style:Theme.of(context).textTheme.bodyLarge
                ),
                Text(
                    profile1.getPhone(),
                    style:Theme.of(context).textTheme.bodyLarge
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 24,
                right: 24,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        StringsManager.profile,
                        style: Theme.of(context).textTheme.labelLarge
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      //   width: double.infinity,
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  StringsManager.eFirstName,
                                  style:Theme.of(context).textTheme.bodySmall
                              ),
                              Row(
                                children:[
                                  Container(
                                    width: 200,
                                    child: TextField(
                                      controller: _firstNameController,
                                      onSubmitted: (value) {
                                        _firstNameController.text=value;
                                      },

                                    ),
                                  ),
                                  IconButton(
                                      icon:  Icon(Icons.check,color:profile.getColor1(),),
                                      onPressed: () {
                                        profile.updateFirstName(_firstNameController.value.text);profile.setColor1();
                                        print(profile.studentUpdate.firstName);
                                      })
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //   width: double.infinity,
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  StringsManager.eLastName,
                                  style:Theme.of(context).textTheme.bodySmall
                              ),
                              Row(
                                children:[
                                  Container(
                                    width: 200,
                                    child: TextField(
                                      controller: _lastNameController,
                                      onSubmitted: (value) {
                                        _lastNameController.text=value;
                                      },

                                    ),
                                  ),
                                  IconButton(
                                      icon:  Icon(Icons.check,color:profile.getColor2(),),
                                      onPressed: () {
                                        profile.updateLastName(_lastNameController.value.text);profile.setColor2();
                                      })
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.email,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StringsManager.username,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 200,

                                    child: TextField(
                                      controller: _emailController,
                                      enabled: false,
                                      onSubmitted: (value) {
                                        _emailController.text=value;
                                      },

                                    ),
                                  ),
                                  IconButton(
                                      icon:  Icon(Icons.check,color:profile.getColor3(),),
                                      onPressed: () {
                                        profile.updateEmail(_emailController.value.text);
                                        profile.setColor3();
                                      })

                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StringsManager.ePhoneNumber,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 200,
                                    child: TextField(
                                      controller: _phoneNumberController,

                                      onSubmitted: (value) {
                                        _phoneNumberController.text=value;
                                      },

                                    ),
                                  ),
                                  IconButton(
                                      icon:  Icon(Icons.check,color:profile.getColor4(),),
                                      onPressed: () {
                                        profile.updatePhone(_phoneNumberController.value.text);
                                        profile.setColor4();
                                      })
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppPadding.p28,horizontal: AppPadding.p50),
                      child: ElevatedButton(

                        onPressed: () {
                          profile.updateSupervisor();
                        },
                        child:  Text(StringsManager.save),

                      ),
                    ),
                    Form(
                      key: _globalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: AppPadding.p28,top: AppPadding.p28),
                            child:  Row(
                              children: [
                                Icon(Icons.password,size: AppSize.s20,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                                  child: Text(StringsManager.changePassword,style: Theme.of(context).textTheme.titleMedium,),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: AppPadding.p12),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return StringsManager.eOldPassword;
                                } else {
                                  profile.setOldPassword(value);
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              controller: _p1controoler,
                              decoration:  InputDecoration(
                                hintText: StringsManager.oldPassword,

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: AppPadding.p12),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return StringsManager.eNewPassword;
                                } else {
                                  profile.setNewPassword(value);
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              controller: _p2controoler,
                              decoration:  InputDecoration(
                                hintText: StringsManager.newPassword,

                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: AppPadding.p12),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return StringsManager.eConfirmPassword;
                                } else {
                                  profile.setNewPasswordConfirmation(value);
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: _p3controoler,
                              decoration:  InputDecoration(
                                hintText: StringsManager.confirmPassword,

                                //  errorText: StringsManager.usernameError,
                              ),

                            ),
                          ),
                          const SizedBox(height: 10,),
                          ElevatedButton(onPressed: () {
                            if (_globalKey.currentState!.validate()) {
                              profile.updatePassword();
                            }
                          },
                            child:  Text(StringsManager.save),

                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
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

/*
 StreamBuilder<FlowState>(
          stream:
          Provider.of<ProfileViewModel>(context, listen: false).outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget( context, contentWidget(), () {
              Provider.of<ProfileViewModel>(context, listen: false).start();
            }) ??
                contentWidget();
          })
 */
