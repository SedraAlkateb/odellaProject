import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_phoenix/generated/i18n.dart';
import 'package:provider/provider.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/presentation/common/image/downloadImage.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/component/icon_notification.dart';
import 'package:untitled/presentation/page_superviser/drawer/view/drawer.dart';
import 'package:untitled/presentation/page_superviser/home_supervisor/view_model/home_super_viewmodel.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/scan_qr_view/view_model/scan_qr_viewmodel.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/style_manage.dart';
import '../../../resources/values_manager.dart';

class HomeSupervisorView extends StatefulWidget {
  const HomeSupervisorView({Key? key}) : super(key: key);

  @override
  State<HomeSupervisorView> createState() => _HomeSupervisorViewState();

  getPosition() {}
}

class _HomeSupervisorViewState extends State<HomeSupervisorView> {
  bool isChecked = true;
  bool isLocked = true;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeSuperVisorViewModel>(context, listen: false).start();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Consumer<HomeSuperVisorViewModel>(
        builder: (context, model, child) => Scaffold(
            drawer: DrawerSupervisorView(),
            appBar: AppBar(
              actions: [notificationIcon(context)],
              title: Text(LocaleKeys.Home.tr(),
                  style: getBoldStyle(
                      color: ColorManager.sidBarIcon, fontSize: FontSize.s20)),
            ),
            body: Provider.of<HomeSuperVisorViewModel>(context)
                        .getStateScreen() ==
                    0
                ? SafeArea(
                    child: orientation == Orientation.portrait
                        ? screen1()
                        : screen2(),
                  )
                : Provider.of<HomeSuperVisorViewModel>(context)
                            .getStateScreen() ==
                        1
                    ? StateRenderer(
                        stateRendererType: StateRendererType
                            .fullScreenLoadingState,
                        message: "Loading",
                        retryActionFunction: () {})
                    : Provider.of<HomeSuperVisorViewModel>(context)
                                .getStateScreen() ==
                            2
                        ? StateRenderer(
                            stateRendererType: StateRendererType
                                .fullScreenErrorState,
                            message: "something wrong",
                            retryActionFunction: () {
                              Provider.of<HomeSuperVisorViewModel>(context,
                                      listen: false)
                                  .getHomeSuperVisor();
                            })
                        : StateRenderer(
                            stateRendererType:
                                StateRendererType.fullScreenEmptyState,
                            message: LocaleKeys.supervisortransferNow.tr(),
                            retryActionFunction: () {})),
      );
    });
  }

  Widget screen1() {
    return Consumer<HomeSuperVisorViewModel>(
      builder: (context, model, child) => Column(
        children: [
          Container(
            height: 10.h,
            margin: EdgeInsets.symmetric(horizontal: 20.sp),
            child: TextFormField(
              onChanged: (value) {
                try {
                  model.setSearch(value);
                } catch (e, s) {
                  print(s);
                }
              },
              decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 0.5.w),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppSize.s16),
                    ),
                  ),
                  // fillColor: ColorManager.white,
                  border: OutlineInputBorder(
                    //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                    borderSide:
                        BorderSide(color: ColorManager.shadow, width: 0.5.w),
                  ),
                  hintStyle: getRegularStyle(
                      color: ColorManager.icon, fontSize: FontSize.s16),
                  hintText: LocaleKeys.searchstudent.tr(),
                  //       hintStyle:Theme.of(context).textTheme.bodySmall,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 8.sp),
                    child: Icon(
                      Icons.search,
                      color: ColorManager.button,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 1.h)),
            ),
          ),
          SizedBox(height: 4.h),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.redAccent,
                    ),
                    child: Center(
                      child: Text(
                       "${ model.getUser().length}",
                        style: getBoldStyle(
                            color: Colors.black54, fontSize: FontSize.s16),
                      ),
                    )),
                Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.sidBar,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.informationTrip);
                      },
                      onLongPress: () {
                        showDetailFunc(context, 27.h, 27.h, 25.w, 25.w);
                      },
                      child: Icon(Icons.question_mark_rounded)),
                ),
                IconButton(
                    onPressed: () async {
                      await Provider.of<ScanQrViewModel>(context, listen: false)
                          .scanBarcode();
                      Provider.of<ScanQrViewModel>(context, listen: false)
                          .confirmQr(Provider.of<HomeSuperVisorViewModel>(
                                  context,
                                  listen: false)
                              .getHomeSuperVisor()
                              .id);
                    },
                    icon: Icon(Icons.qr_code_scanner)),
                SizedBox(height: 4.h),
                IconButton(
                  icon: Icon(Icons.stop_circle_outlined),
                  onPressed: () {
                    model.stopTracking();
                  },
                )
              ],
            ),
          ),
          Container(
            height: 5.h,
            //  width: 10.w,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text("Get All student"),
                    onPressed: () {
                      model.setAllUser();
                    },
                  ),
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    hint: Text(LocaleKeys.transferPositions.tr()),
                    validator: (value) {
                      if (value == null) {
                        return LocaleKeys.transferPositions.tr();
                      }
                      return null;
                    },
                    items: model
                        .getPositions()
                        .map((e) => e != []
                        ? DropdownMenuItem(
                      value: e,
                      child: Text(" ${e.name}"),
                    )
                        : DropdownMenuItem(
                      //  value: e,
                      child: Text("no positions"),
                    ))
                        .toList(),
                    onChanged: (val) {
                      LoadingState(stateRendererType: StateRendererType.popupLoadingState).showPopup(context, StateRendererType.popupLoadingState, LocaleKeys.loading.tr());
                      model.studentPosition(val.id).then((value) {
                        if(value){
                          SuccessState("success").dismissDialog(context);
                          SuccessState("success").showPopup(context,StateRendererType.popupSuccess , "Success");
                        }else{
                          ErrorState(StateRendererType.popupErrorState,"Something worng").dismissDialog(context);
                          ErrorState(StateRendererType.popupErrorState,"Something worng").showPopup(context,StateRendererType.popupSuccess , "Something worng");
                        }
                        });

                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Row(children: [
            model.getLocationData() != null
                ? Text(
                    'Lat: ${model.getLocationData()?.latitude}, Long: ${model.getLocationData()?.longitude}')
                : model.getError() != null
                    ? Text('Error: ${model.getError()}')
                    : CircularProgressIndicator(),
          ]),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 25.sp),
                padding: EdgeInsets.all(20.sp),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(28),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${model.getUser()[index].firstName} ${model.getUser()[index].lastName}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                model.getUser()[index].email,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 0.3.h,
                              ),
                              Text(
                                model.getUser()[index].phoneNumber,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    ),
                    Checkbox( value: isChecked,
                        onChanged: isLocked ? null : (value) {
                          setState(() {
                            isChecked = value!;
                            if (isChecked) {
                              LoadingState(stateRendererType: StateRendererType.popupLoadingState).showPopup(context, StateRendererType.popupLoadingState, LocaleKeys.loading.tr());
                              model.confirmQr( model.getUser()[index].id).then((value) {
                                if(value){
                                  SuccessState("success").dismissDialog(context);
                                  SuccessState("success").showPopup(context,StateRendererType.popupSuccess , "Success");
                                }else{
                                  ErrorState(StateRendererType.popupErrorState,"Something worng").dismissDialog(context);
                                  ErrorState(StateRendererType.popupErrorState,"Something worng").showPopup(context,StateRendererType.popupSuccess , "Something worng");
                                }
                              }

                              );
                              isLocked = true;
                            }
                          }
                          );
                        }
                    ),
                  ],
                ),
              ),
              separatorBuilder: (_, index) => SizedBox(
                height: 2.h,
              ),
              itemCount: model.getUser().length,
            ),
          ),
        ],
      ),
    );
  }

  Widget screen2() {
    return Consumer<HomeSuperVisorViewModel>(
      builder: (context, model, child) => Column(
        children: [
          Container(
            height: 5.h,
            margin: EdgeInsets.symmetric(horizontal: 40.sp),
            child: TextFormField(
              onChanged: (value) {
                try {
                  Provider.of<HomeSuperVisorViewModel>(context, listen: false)
                      .setSearch(value);
                } catch (e, s) {
                  print(s);
                }
              },
              decoration: InputDecoration(
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 0.5.w),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppSize.s16),
                  ),
                ),
                // fillColor: ColorManager.white,
                border: OutlineInputBorder(
                  //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                  borderSide:
                      BorderSide(color: ColorManager.shadow, width: 0.5.w),
                ),
                hintStyle: getRegularStyle(
                    color: ColorManager.icon, fontSize: FontSize.s16),
                hintText: LocaleKeys.searchstudent.tr(),
                //       hintStyle:Theme.of(context).textTheme.bodySmall,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 8.sp),
                  child: Icon(
                    Icons.search,
                    color: ColorManager.button,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 25.sp),
                padding: EdgeInsets.all(20.sp),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(28),
                            ),
                            child: FadeInImage.assetNetwork(
                              placeholder: ImageAssets.gray, // الصورة المؤقتة
                              image: ImageDownloader.getUrl(model
                                      .getHomeSuperVisor()
                                      .users?[index]
                                      .image ??
                                  ""), // الصورة الفعلية
                              fit: BoxFit.contain,
                              imageErrorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey, // الخلفية البديلة
                                  ),
                                );
                              },
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${model.getUser()[index].firstName} ${model.getUser()[index].lastName}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              model.getUser()[index].email,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: AppSize.s12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 0.3.h,
                            ),
                            Text(
                              model.getUser()[index].phoneNumber,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: AppSize.s12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (_, index) => SizedBox(
                height: 2.h,
              ),
              itemCount: model.getUser().length,
            ),
          ),
        ],
      ),
    );
  }

  showDetailFunc(context, double h1, double w1, double h2, double w2) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15.sp),
              height: h1,
              width: w1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    width: w2,
                    height: h2,
                    child: Text(
                      LocaleKeys.tripinformation.tr(),
                      style: TextStyle(
                          color: ColorManager.sidBar, fontSize: AppSize.s15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
