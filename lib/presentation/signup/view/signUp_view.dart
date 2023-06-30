import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/language_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import 'package:untitled/presentation/signup/view_model/signup_view_model.dart';
import 'dart:math'as math;

import '../../../lang/locale_keys.g.dart';
class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  SignUpViewModel _signUpViewModel = instance<SignUpViewModel>();

  GlobalKey<FormBuilderState> _fbKey1 = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> _fbKey2 = GlobalKey<FormBuilderState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    isobscured=true;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      ss=Provider.of<SignUpViewModel>(context, listen: false);
      Provider.of<SignUpViewModel>(context, listen: false).start();
    });
    super.initState();
  }
  var isobscured;
  late SignUpViewModel ss;
  @override
  void dispose() {
  //  Provider.of<SignUpViewModel>(context,listen: false).dispose();
ss.nnum=0;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey,
      body:
      Provider.of<SignUpViewModel>(context).getStateScreen() == 0
          ?   _getContentWidget()
          :Provider.of<SignUpViewModel>(context).getStateScreen()==1
          ?StateRenderer(
          stateRendererType: StateRendererType.fullScreenLoadingState,
          message: "Loading",
          retryActionFunction: () {})
          : Provider.of<SignUpViewModel>(context).getStateScreen()==2
          ? StateRenderer(
          stateRendererType: StateRendererType.fullScreenErrorState,
          message: "Loading",
          retryActionFunction: () {})
          : StateRenderer(
          stateRendererType: StateRendererType.fullScreenEmptyState,
          message: "Loading",
          retryActionFunction: () {})

    );
  }

  Widget _getContentWidget() {
    var _register1 = Provider.of<SignUpViewModel>(context);
    if (Provider.of<SignUpViewModel>(context).isLog == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<SignUpViewModel>(context, listen: false).isLog = false;
        Navigator.pushReplacementNamed(context, Routes.afterSignUp);
      });
    }
    return Form(
      key: _globalKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(AppSize.s50),
                        bottomLeft: Radius.circular(AppSize.s50),
                      ),
                      child:
                      Container(
                        color: ColorManager.icon,
                        width: double.infinity,
                        //    height: double.maxFinite,
                        child:
                        Provider.of<SignUpViewModel>(context).getImage() !=
                            null
                            ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p50),
                          child: InkWell(
                            onTap: () => Provider.of<SignUpViewModel>(
                                context,
                                listen: false)
                                .setImageFromGallory(),
                            child: Container(
                                width: 160.0,
                                height: 160.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[300],
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: FileImage(
                                        Provider.of<SignUpViewModel>(
                                            context)
                                            .getImage()!,
                                      ),
                                    ))),
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p50),
                          child: InkWell(
                            onTap: () => Provider.of<SignUpViewModel>(
                                context,
                                listen: false)
                                .setImageFromGallory(),
                            child: Container(
                                width: 160,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.add,
                                    size: 50,
                                    color: Color(0xFFFFFFFF))),
                          ),
                        ),
                      )),

                  Provider.of<SignUpViewModel>(context)
                              .getNum() ==
                          2
                      ? Padding(
                    padding: const EdgeInsets.only(
                        top: AppPadding.p16, left: AppPadding.p8),
                    child: IconButton(
                        onPressed: () {
                          Provider.of<SignUpViewModel>(context,
                              listen: false)
                              .setNum(1);
                        },
                        icon: Icon(
                          Icons.west,
                          color: ColorManager.gr,
                        )),
                  )
                      : Container(),
                ],
              ),
            ),
            Provider.of<SignUpViewModel>(context).getNum() == 0
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28,
                      right: AppPadding.p28,
                      bottom: AppPadding.p28,
                      top: AppPadding.p28),
                  child: Text(
                    LocaleKeys.signUp.tr(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                    bottom: AppPadding.p28,
                  ),
                  child: TextFormField(
                    controller: _firstNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.errorFirstName.tr();
                      } else {
                        Provider.of<SignUpViewModel>(context,
                            listen: false)
                            .setFirstName(value);
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: LocaleKeys.eFirstName.tr(),
                      labelText: LocaleKeys.eFirstName.tr(),
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
                      bottom: AppPadding.p28),
                  child: TextFormField(
                    controller: _lastNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.errorLastName.tr();
                      } else {
                        Provider.of<SignUpViewModel>(context,
                            listen: false)
                            .setLastName(value);
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: LocaleKeys.eLastName.tr(),
                      labelText: LocaleKeys.eLastName.tr(),
                      prefixIcon: Icon(
                        Icons.perm_identity,
                        color: ColorManager.kMainColor,
                      ),
                      //   fillColor: ColorManager.kMainColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28,
                      right: AppPadding.p28,
                      bottom: AppPadding.p28),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.errorEmail.tr();
                      } else {
                        Provider.of<SignUpViewModel>(context,
                            listen: false)
                            .setEmail(value);
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: LocaleKeys.email.tr(),
                      labelText: LocaleKeys.email.tr(),
                      prefixIcon: Icon(
                        Icons.email,
                        color: ColorManager.kMainColor,
                      ),
                      //   fillColor: ColorManager.kMainColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28,
                      right: AppPadding.p28,
                      bottom: AppPadding.p28),

                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    obscureText: isobscured,

                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.errorPassword.tr();
                      } else {
                        Provider.of<SignUpViewModel>(context,
                            listen: false)
                            .setPassword(value);
                      }
                      return null;
                    },
                    decoration:  InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              isobscured=!isobscured;
                            }
                            );
                          },

                          icon: isobscured?  Icon(Icons.visibility,
                            color: ColorManager.kMainColor,
                          ):
                          Icon(Icons.visibility_off,

                            color: ColorManager.kMainColor,
                          )),
                      hintText: LocaleKeys.password,
                      labelText: LocaleKeys.password,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28,
                      right: AppPadding.p28,
                      bottom: AppPadding.p28),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _phoneNumberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.errorPhoneNumber.tr();
                      } else {
                        Provider.of<SignUpViewModel>(context,
                            listen: false)
                            .setPhoneNumber(value);
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: LocaleKeys.ePhoneNumber.tr(),
                      labelText: LocaleKeys.ePhoneNumber.tr(),
                      prefixIcon: Icon(
                        Icons.local_phone,
                        color: ColorManager.kMainColor,
                      ),
                      //   fillColor: ColorManager.kMainColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p28),
                  child: InkWell(
                    onTap: () {
                      if (_globalKey.currentState!.validate()) {

                        Provider.of<SignUpViewModel>(context,
                            listen: false)
                            .setNum(1);

                      }
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
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
            )
                : Provider.of<SignUpViewModel>(context).getNum() == 1
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28,
                      right: AppPadding.p28,
                      bottom: AppPadding.p28,
                      top: AppPadding.p60),
                  child: Text(
                    " your information",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppPadding.p28),
                        child: DropdownButtonFormField(
                            icon:
                            const Icon(Icons.keyboard_arrow_down),
                            hint: Text(
                                LocaleKeys.transportationLines.tr()),
                            validator: (value) {
                              if (value == null) {
                                return LocaleKeys.transportationLines.tr();
                              }
                              //  return null;
                            },
                            items: _register1
                                .getDataTransportationLines()
                                .map((e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(" ${e.name}"),
                            ))
                                .toList(),
                            onChanged: (val) {
                              Provider.of<SignUpViewModel>(context,
                                  listen: false)
                                  .setTransportationLineId(val!);
                              Provider.of<SignUpViewModel>(context,
                                  listen: false)
                                  .getPositionLineData(val);

                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppPadding.p28),
                        child: DropdownButtonFormField(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          hint:
                          Text(LocaleKeys.transferPositions.tr()),
                          validator: (value) {
                            if (value == null) {
                              return LocaleKeys.transferPositions.tr();
                            }
                            return null;
                          },
                          items: _register1
                              .getPosition()
                              .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(" ${e.name}"),
                          ))
                              .toList(),
                          onChanged: (val) {
                            Provider.of<SignUpViewModel>(context,
                                listen: false)
                                .setTransferPositionId(val!.id);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppPadding.p28),
                        child: DropdownButtonFormField(
                            icon:
                            const Icon(Icons.keyboard_arrow_down),
                            hint: Text(LocaleKeys.universities.tr()),
                            validator: (value) {
                              if (value == null) {
                                return LocaleKeys.universities.tr();
                              }
                              return null;
                            },
                            items: _register1
                                .getUniversities()
                                .map((e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(" ${e.name}"),
                            ))
                                .toList(),
                            onChanged: (val) {
                              Provider.of<SignUpViewModel>(context,
                                  listen: false)
                                  .setUniversityId(val!);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppPadding.p28),
                        child: Container(
                          width: double.infinity,
                          height: AppSize.s0_5,
                          color: ColorManager.icon,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppPadding.p28),
                        child: DropdownButtonFormField(
                            icon:
                            const Icon(Icons.keyboard_arrow_down),
                            hint: Text(LocaleKeys.cities.tr()),
                            validator: (value) {
                              if (value == null) {
                                return LocaleKeys.eCities.tr();
                              }
                              //  return null;
                            },
                            items: _register1
                                .getCities()
                                .map((e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(" ${e.name}"),
                            ))
                                .toList(),
                            onChanged: (val) {
                              Provider.of<SignUpViewModel>(context,
                                  listen: false)
                                  .setCityId(val!);
                              Provider.of<SignUpViewModel>(context,
                                  listen: false)
                                  .getAreasByIdCity(val);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppPadding.p28),
                        child: DropdownButtonFormField(
                            icon:
                            const Icon(Icons.keyboard_arrow_down),
                            hint: Text(LocaleKeys.areas.tr()),
                            validator: (value) {
                              if (value == null) {
                                return LocaleKeys.eAreas.tr();
                              }
                              return null;
                            },
                            items: _register1
                                .getAreas()
                                .map((e) => DropdownMenuItem(
                              value: e.name,
                              child: Text(" ${e.name}"),
                            ))
                                .toList(),
                            onChanged: (val) {
                              print(val);
                              //       _register2.setAreaId(val!);
                            }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p28,
                      vertical: AppPadding.p28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Provider.of<SignUpViewModel>(context,
                              listen: false)
                              .setNum(0);

                          //     }
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: ColorManager.icon,
                              child: Icon(
                                Icons.keyboard_arrow_left_rounded,
                                color: ColorManager.white,
                                size: 60,
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_globalKey.currentState!.validate()) {

                            Provider.of<SignUpViewModel>(context,
                                listen: false)
                                .setNum(2);

                          }
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: ColorManager.icon,
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(isRtl() ? math.pi :0),
                                child: Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: ColorManager.white,
                                  size: 60,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
                : Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p18,
                  vertical: AppPadding.p28),
              child: Column(
                children: [
                  Container(
                    height: AppSize.s50,
                    decoration: BoxDecoration(
                      color: ColorManager.card,
                      borderRadius:
                      BorderRadius.circular(AppSize.s18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                              LocaleKeys.subscription.tr(),
                              textAlign: TextAlign.center,
                              style:
                              Theme.of(context).textTheme.titleMedium,
                            )),
                        Container(
                          width: 1.0,
                          color: Colors.grey[200],
                        ),
                        Expanded(
                            child: Text(
                              LocaleKeys.daysNumber.tr(),
                              textAlign: TextAlign.center,
                              style:
                              Theme.of(context).textTheme.titleMedium,
                            )),
                        Container(
                          width: 1.0,
                          color: Colors.grey[200],
                        ),
                        Expanded(
                            child: Text(
                              LocaleKeys.price.tr(),
                              textAlign: TextAlign.center,
                              style:
                              Theme.of(context).textTheme.titleMedium,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (context, index) =>
                            Container(
                              width: double.infinity,
                              height: AppSize.s8,
                              color: Colors.white,
                            ),
                        itemCount: Provider.of<SignUpViewModel>(
                            context,
                            listen: false)
                            .getDataSubscriptions()
                            .length,
                        itemBuilder: (context, index) => _register1
                            .getC() ==
                            index
                            ? Container(
                          height: AppSize.s50,
                          decoration: BoxDecoration(
                            color: ColorManager.card,
                            borderRadius: BorderRadius.circular(
                                AppSize.s18),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _register1
                                          .getDataSubscriptions()[
                                      index]
                                          .name,
                                      maxLines: 1,
                                      overflow:
                                      TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 2.0,
                                color: Colors.grey[200],
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _register1
                                          .getDataSubscriptions()[
                                      index]
                                          .daysNumber,
                                      maxLines: 1,
                                      overflow:
                                      TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.grey[200],
                                width: 2.0,
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _register1
                                          .getDataSubscriptions()[
                                      index]
                                          .price,
                                      maxLines: 1,
                                      overflow:
                                      TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                            : Container(
                          height: AppSize.s50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(
                                AppSize.s18),
                          ),
                          child: InkWell(
                            onTap: (() {
                              Provider.of<SignUpViewModel>(
                                  context,
                                  listen: false)
                                  .setC(
                                  index,
                                  Provider.of<SignUpViewModel>(
                                      context,
                                      listen: false)
                                      .getDataSubscriptions()[
                                  index]
                                      .id);
                            }),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                    children: [
                                      Text(
                                        Provider.of<SignUpViewModel>(
                                            context,
                                            listen: false)
                                            .getDataSubscriptions()[
                                        index]
                                            .name,
                                        maxLines: 1,
                                        overflow: TextOverflow
                                            .ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 2.0,
                                  color: Colors.grey[200],
                                ),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                    children: [
                                      Text(
                                        Provider.of<SignUpViewModel>(
                                            context,
                                            listen: false)
                                            .getDataSubscriptions()[
                                        index]
                                            .daysNumber,
                                        maxLines: 1,
                                        overflow: TextOverflow
                                            .ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.grey[200],
                                  width: 2.0,
                                ),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                    children: [
                                      Text(
                                        Provider.of<SignUpViewModel>(
                                            context,
                                            listen: false)
                                            .getDataSubscriptions()[
                                        index]
                                            .price,
                                        maxLines: 1,
                                        overflow: TextOverflow
                                            .ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p28,
                                vertical: AppPadding.p28),
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(isRtl() ? math.pi :0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                        Provider.of<SignUpViewModel>(context,
                                                listen: false)
                                            .setNum(0);

                                      //     }
                                    },
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: ColorManager.icon,
                                          child: Transform(
                                            alignment: Alignment.center,
                                            transform: Matrix4.rotationY(isRtl() ? math.pi :0),
                                            child: Icon(
                                              Icons.keyboard_arrow_left_rounded,
                                              color: ColorManager.white,
                                              size: 60,
                                            ),
                                          )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (_globalKey.currentState!.validate()) {

                                          Provider.of<SignUpViewModel>(context,
                                                  listen: false)
                                              .setNum(2);

                                      }
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: ColorManager.icon,
                                          child: Transform(
                                            alignment: Alignment.center,
                                            transform: Matrix4.rotationY(isRtl() ? math.pi :0),
                                            child: Icon(
                                              Icons.keyboard_arrow_right_rounded,
                                              color: ColorManager.white,
                                              size: 60,
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p18,
                            vertical: AppPadding.p28),
                        child: Column(
                          children: [
                            Container(
                              height: AppSize.s50,
                              decoration: BoxDecoration(
                                color: ColorManager.card,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s18),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Text(
                                        LocaleKeys.subscription.tr(),
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )),
                                  Container(
                                    width: 1.0,
                                    color: Colors.grey[200],
                                  ),
                                  Expanded(
                                      child: Text(
                                        LocaleKeys.daysNumber.tr(),
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )),
                                  Container(
                                    width: 1.0,
                                    color: Colors.grey[200],
                                  ),
                                  Expanded(
                                      child: Text(
                                        LocaleKeys.price.tr(),
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 400,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  separatorBuilder: (context, index) =>
                                      Container(
                                        width: double.infinity,
                                        height: AppSize.s8,
                                        color: Colors.white,
                                      ),
                                  itemCount: Provider.of<SignUpViewModel>(
                                          context,
                                          listen: false)
                                      .getDataSubscriptions()
                                      .length,
                                  itemBuilder: (context, index) => _register1
                                              .getC() ==
                                          index
                                      ? Container(
                                          height: AppSize.s50,
                                          decoration: BoxDecoration(
                                            color: ColorManager.card,
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s18),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      _register1
                                                          .getDataSubscriptions()[
                                                              index]
                                                          .name,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayLarge,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 2.0,
                                                color: Colors.grey[200],
                                              ),
                                              Expanded(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      _register1
                                                          .getDataSubscriptions()[
                                                              index]
                                                          .daysNumber,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayLarge,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                color: Colors.grey[200],
                                                width: 2.0,
                                              ),
                                              Expanded(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      _register1
                                                          .getDataSubscriptions()[
                                                              index]
                                                          .price,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayLarge,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          height: AppSize.s50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s18),
                                          ),
                                          child: InkWell(
                                            onTap: (() {
                                              Provider.of<SignUpViewModel>(
                                                      context,
                                                      listen: false)
                                                  .setC(
                                                      index,
                                                      Provider.of<SignUpViewModel>(
                                                              context,
                                                              listen: false)
                                                          .getDataSubscriptions()[
                                                              index]
                                                          .id);
                                            }),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        Provider.of<SignUpViewModel>(
                                                                context,
                                                                listen: false)
                                                            .getDataSubscriptions()[
                                                                index]
                                                            .name,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayLarge,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 2.0,
                                                  color: Colors.grey[200],
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        Provider.of<SignUpViewModel>(
                                                                context,
                                                                listen: false)
                                                            .getDataSubscriptions()[
                                                                index]
                                                            .daysNumber,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayLarge,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.grey[200],
                                                  width: 2.0,
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        Provider.of<SignUpViewModel>(
                                                                context,
                                                                listen: false)
                                                            .getDataSubscriptions()[
                                                                index]
                                                            .price,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayLarge,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p28,
                                  right: AppPadding.p28,
                                  top: AppPadding.p28),
                              child: SizedBox(
                                width: double.infinity,
                                height: AppSize.s64,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_globalKey.currentState!.validate()) {
                                        Provider.of<SignUpViewModel>(context,
                                                listen: false)
                                            .getSignUp();
                                        Provider.of<SignUpViewModel>(context,listen: false).getDialog()==1
                                        ? StateRenderer(
                                            stateRendererType: StateRendererType.popupLoadingState,
                                            message: "Loading",
                                            retryActionFunction: () {})
                                            :StateRenderer(
                                            stateRendererType: StateRendererType.popupErrorState,
                                            message: "Loading",
                                            retryActionFunction: () {
                                            });
                                      }
                                    },
                                    child: Text(LocaleKeys.signUp.tr())),
                              ),
                            ),
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }
  isRtl(){
    return context.locale==ARABIC_LOCALE;
  }
}
