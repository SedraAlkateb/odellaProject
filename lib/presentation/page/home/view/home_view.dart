import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/component/icon_notification.dart';
import 'package:untitled/presentation/page/drawer/view/drawer.dart';
import 'package:untitled/presentation/page/home/view_model/home_view_model.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import '../../../../lang/locale_keys.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  late NavigatorState _navigator;

  void didChangeDependencies() {
    if( Provider.of<HomeViewModel>(context).getStateScreen() == 4){
      Navigator.pushNamed(context, Routes.backToLogin);
    }
    _navigator = Navigator.of(context);
    super.didChangeDependencies();
  }

  final _scaffoldKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var home = Provider.of<HomeViewModel>(context, listen: false);
      home.start();
    });
  }

  @override
  Widget build(BuildContext context) {

    if (Provider.of<HomeViewModel>(context).getIsPos()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<HomeViewModel>(context, listen: false).setIsPos(false);
        _navigator.pushNamed(Routes.polyLineRoute);
      });
    }
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            LocaleKeys.Home.tr(),
            style: getBoldStyle(
                color: ColorManager.sidBarIcon, fontSize: FontSize.s20),

          ),
          actions: [notificationIcon(context)],
        ),
        key: _scaffoldKey,
        body:
        Provider.of<HomeViewModel>(context).getStateScreen() == 0
            ? contentWidget()
            :Provider.of<HomeViewModel>(context).getStateScreen()==1
            ?StateRenderer(
                stateRendererType: StateRendererType.fullScreenLoadingState,
                message: "Loading",
                retryActionFunction: () {})
           : Provider.of<HomeViewModel>(context).getStateScreen()==2
           ? StateRenderer(
           stateRendererType: StateRendererType.fullScreenErrorState,
           message:  Provider.of<HomeViewModel>(context,listen: false).getMessage1(),
           retryActionFunction: () {
             Provider.of<HomeViewModel>(context,listen: false).getTransportationLinesData();
           })
            : StateRenderer(
            stateRendererType: StateRendererType.fullScreenEmptyState,
            message: "Not found any transmission lines",
            retryActionFunction: () {})

    );


  }
  Widget contentWidget() {
    RefreshController _refreshController =
    RefreshController(initialRefresh: false);

    void _onRefresh() async {
      Provider.of<HomeViewModel>(context,listen: false).getTransportationLinesData();
      _refreshController.refreshCompleted();
    }
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.p20,
            right: AppPadding.p20,
            bottom: AppPadding.p20),
        child: TextFormField(
          onChanged: (value) {
            try {
              Provider.of<HomeViewModel>(context, listen: false)
                  .setSearch(value);
            } catch (e, s) {
              print(s);
            }
          },
          decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey.shade300, width: AppSize.s1_5),
              borderRadius: const BorderRadius.all(
                Radius.circular(AppSize.s16),
              ),
            ),
            // fillColor: ColorManager.white,
            border: OutlineInputBorder(
              //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
              borderSide:
                  BorderSide(color: ColorManager.shadow, width: AppSize.s1_5),
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
      Expanded(
          child: Provider.of<HomeViewModel>(context, listen: false)
                      .dataTransportationLinesSearch
                      .length ==
                  0
              ?
          Center(
                  child: StateRenderer(
                      stateRendererType: StateRendererType.fullScreenEmptyState,
                      message: "Not found any transmission line",
                      retryActionFunction: () {}),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28,
                      right: AppPadding.p28,
                      bottom: AppPadding.p28),
                  child:

                  SmartRefresher(
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
                      itemCount:
                          Provider.of<HomeViewModel>(context, listen: false)
                              .dataTransportationLinesSearch
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
                            Provider.of<HomeViewModel>(context, listen: false)
                                .setLine(Provider.of<HomeViewModel>(context,
                                        listen: false)
                                    .dataTransportationLines[index]);
                            Provider.of<HomeViewModel>(context, listen: false)
                                .getPositionLineData(Provider.of<HomeViewModel>(
                                        context,
                                        listen: false)
                                    .dataTransportationLines[index]
                                    .id);
                          }),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppPadding.p16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Provider.of<HomeViewModel>(context,
                                                  listen: false)
                                              .dataTransportationLinesSearch[
                                                  index]
                                              .name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                        color:
                                                            ColorManager.button,
                                                      ),
                                                      Text(
                                                        Provider.of<HomeViewModel>(
                                                                context,
                                                                listen: false)
                                                            .dataTransportationLinesSearch[
                                                                index]
                                                            .from!
                                                            .name,
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineMedium,
                                                      ),
                                                    ],
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_down_sharp,
                                                    size: AppSize.s12,
                                                    color: ColorManager.button,
                                                  ),
                                                  Icon(
                                                      Icons
                                                          .keyboard_arrow_down_sharp,
                                                      size: AppSize.s12,
                                                      color: ColorManager.button),
                                                  //   Icon(Icons.circle_sharp,size: AppSize.s8,color: ColorManager.grey,),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.gps_fixed,
                                                        size: AppSize.s12,
                                                        color:
                                                            ColorManager.button,
                                                      ),
                                                      Text(
                                                        Provider.of<HomeViewModel>(
                                                                context,
                                                                listen: false)
                                                            .dataTransportationLinesSearch[
                                                                index]
                                                            .to!
                                                            .name,
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        style: Theme.of(context)
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
                        ),
                      ),
                    ),
                  ),
                ))
    ]);
  }
}
