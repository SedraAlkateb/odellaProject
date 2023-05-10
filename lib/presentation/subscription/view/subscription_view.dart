import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/presentation/subscription/view_model/subscription_view_model.dart';
class SubscriptionView extends StatefulWidget {
  const SubscriptionView({Key? key}) : super(key: key);

  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  @override
  final _globalKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _global = GlobalKey<ScaffoldState>();
  SubscriptionViewModel _subscriptionViewModel=instance<SubscriptionViewModel>();
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<SubscriptionViewModel>(context,listen: false).start();
    });
super.initState();
  }
  @override
  void dispose() {
      _subscriptionViewModel.dispose();

    super.dispose();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.popAndPushNamed(context,Routes.afterSplashRoute);
            });

          },
          icon:  SvgPicture.asset(
              ImageAssets.vector,
              semanticsLabel: 'Acme Logo'
          ),

        ),

      ),
      key: _global,
      body:contentWidget()


    );

  }
Widget  contentWidget(){
 return   Form(
      key: _globalKey,
      child: SingleChildScrollView(
        child: Column(
         // crossAxisAlignment:CrossAxisAlignment.center ,
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child:
                Image.asset(ImageAssets.logo4)


            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18, vertical: AppPadding.p18),
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
                              "Subscription",
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
                              "DayNumber",
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
                              "Price",
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
                        itemCount:
                        Provider.of<SubscriptionViewModel>(context).getDataSubscriptions().length,
                        itemBuilder: (context, index) =>
                            Container(
                              height: AppSize.s50,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
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
                                      CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                      children: [
                                        Text(
                                          Provider.of<SubscriptionViewModel>(context)
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
                                          Provider.of<SubscriptionViewModel>(context)
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
                                          Provider.of<SubscriptionViewModel>(context,listen: false)
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
                            )),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
   StreamBuilder<FlowState>(
          stream:
          Provider.of<SubscriptionViewModel>(context, listen: false).outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget( _global.currentContext!, contentWidget(), () {
              Provider.of<SubscriptionViewModel>(context, listen: false).start();
            }) ??
                contentWidget();
          })
 */