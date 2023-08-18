import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/daily_recerviton/view_model/daily_reservation%20_viewmodel.dart';
import 'package:untitled/presentation/daily_reser_map/view_model/daily_reser_map_viewmodel.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import '../../../lang/local_keys.g.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TripDailyReservationView extends StatefulWidget {
  const TripDailyReservationView({super.key});
  @override
  _TripDailyReservationViewState createState() =>
      _TripDailyReservationViewState();
}

class _TripDailyReservationViewState extends State<TripDailyReservationView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<DailyReservationViewModel>(context, listen: false).start();

    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (Provider.of<DailyReservationViewModel>(context).getStateScreen() == 4) {
      Navigator.pushNamed(context, Routes.backToLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Daily reservation",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        body: Provider.of<DailyReservationViewModel>(context)
                    .getStateScreen() ==
                0
            ? contentWidget()
            : Provider.of<DailyReservationViewModel>(context)
                        .getStateScreen() ==
                    1
                ? StateRenderer(
                    stateRendererType: StateRendererType.fullScreenLoadingState,
                    message: "Loading",
                    retryActionFunction: () {})
                : StateRenderer(
                    stateRendererType: StateRendererType.fullScreenErrorState,
                    message: "something wrong",
                    retryActionFunction: () {
                      Provider.of<DailyReservationViewModel>(context,
                              listen: false)
                          .start();
                    }));
  }

  Widget contentWidget() {
    RefreshController _refreshController =
    RefreshController(initialRefresh: false);

    void _onRefresh() async {
      Provider.of<DailyReservationViewModel>(context,listen: false).start();
      _refreshController.refreshCompleted();
    }
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.p20,
            right: AppPadding.p18,
            bottom: AppPadding.p20),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                onChanged: (value) {
                  try {
                    Provider.of<DailyReservationViewModel>(context,
                            listen: false)
                        .setSearch(value);
                  } catch (e, s) {
                    print(s);
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.shade300, width: AppSize.s1_5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppSize.s16),
                    ),
                  ),
// fillColor: ColorManager.white,
                  border: OutlineInputBorder(
//  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                    borderSide: BorderSide(
                        color: ColorManager.shadow, width: AppSize.s1_5),
                  ),
                  hintStyle: getRegularStyle(
                      color: ColorManager.icon, fontSize: FontSize.s16),
                  hintText: LocaleKeys.search.tr(),
//       hintStyle:Theme.of(context).textTheme.bodySmall,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: AppPadding.p8),
                    child: Icon(
                      Icons.search,
                      color: ColorManager.button,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                },
                icon: Icon(
                  Icons.filter_list_outlined,
                  color: ColorManager.icon,
                ))
          ],
        ),
      ),
      Expanded(
          child: Provider.of<DailyReservationViewModel>(context, listen: false)
                      .getTodayTrips()
                      .length ==
                  0
              ? Center(
                  child: SmartRefresher(
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    child: StateRenderer(
                        stateRendererType: StateRendererType.fullScreenEmptyState,
                        message: "Not found any transmission line",
                        retryActionFunction: () {}),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28,
                      right: AppPadding.p28,
                      bottom: AppPadding.p28),
                  child:      SmartRefresher(
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: double.infinity,
                        height: AppSize.s20,
// color: Color,
                      ),
                      itemCount: Provider.of<DailyReservationViewModel>(context,
                              listen: false)
                          .getTodayTrips()
                          .length,
                      itemBuilder: (context, index) => Container(
                        height: AppSize.s150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppSize.s30)),
//        color: ColorManager.card,
                        ),
                        child: InkWell(
                          onTap: (() {
                            Provider.of<DailyReservationViewModel>(context,
                                listen: false)
                                .setLine(index);
                            Provider.of<DailyReservationViewModel>(context,
                                    listen: false)
                                .setTripId(Provider.of<DailyReservationViewModel>(
                                            context,
                                            listen: false)
                                        .getTodayTrips()[index]);
                            Navigator.pushNamed(
                                context, Routes.polyLineDailyView);
                          }),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: AppPadding.p16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: SvgPicture.asset(
                                            ImageAssets.bus,
                                            height: 40,
                                            width: 40,
                                            color: ColorManager.button,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Provider.of<DailyReservationViewModel>(
                                                      context,
                                                      listen: false)
                                                  .getTodayTrips()[index]
                                                  .lines!
                                                  .first
                                                  .name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 2),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.gps_not_fixed,
                                                            size: AppSize.s12,
                                                            color: ColorManager
                                                                .button,
                                                          ),
                                                          Text(
                                                            Provider.of<DailyReservationViewModel>(
                                                                    context,
                                                                    listen: false)
                                                                .getTodayTrips()[
                                                                    index]
                                                                .lines!
                                                                .first
                                                                .name,
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headlineMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_down_sharp,
                                                        size: AppSize.s12,
                                                        color:
                                                            ColorManager.button,
                                                      ),
                                                      Icon(
                                                          Icons
                                                              .keyboard_arrow_down_sharp,
                                                          size: AppSize.s12,
                                                          color: ColorManager
                                                              .button),
//   Icon(Icons.circle_sharp,size: AppSize.s8,color: ColorManager.grey,),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.gps_fixed,
                                                            size: AppSize.s12,
                                                            color: ColorManager
                                                                .button,
                                                          ),
                                                          Text(
                                                            Provider.of<DailyReservationViewModel>(
                                                                    context,
                                                                    listen: false)
                                                                .getTodayTrips()[
                                                                    index]
                                                                .lines!
                                                                .first
                                                                .to!
                                                                .name,
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headlineMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Time"),
                                    SizedBox(height: 4),
                                    Text(
                                      Provider.of<DailyReservationViewModel>(
                                              context,
                                              listen: false)
                                          .getTodayTrips()[index]
                                          .time!
                                          .start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
    ]);
  }
}
