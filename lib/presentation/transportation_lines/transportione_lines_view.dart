
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import '../page/home/view_model/home_view_model.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransportationLinesView extends StatefulWidget {
  @override
  _TransportationLinesViewState createState() => _TransportationLinesViewState();
}

class _TransportationLinesViewState extends State<TransportationLinesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transportation Lines",
          style: Theme
              .of(context)
              .textTheme.labelLarge,),
      ),
      body: Column(

        children: [
          SizedBox(height: 30,),
          Container(
            height: 30,
            child: Padding(
              padding: const EdgeInsets.only(left: 40,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("All transportation lines",style: getBoldStyle(color: ColorManager.sidBarIcon,fontSize: FontSize.s18),),
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p28,
                  right: AppPadding.p28,
                  bottom: AppPadding.p28),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => const SizedBox(
                  width: double.infinity,
                  height: AppSize.s20,
                  // color: Color,
                ),
                itemCount:
                // Provider.of<HomeViewModel>(context, listen: false)
                //     .dataTransportationLinesSearch
                //     .length,
                3,
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
                      // Provider.of<HomeViewModel>(context, listen: false)
                      //     .setLine(Provider.of<HomeViewModel>(context,
                      //     listen: false)
                      //     .dataTransportationLines[index]);
                      // Provider.of<HomeViewModel>(context, listen: false)
                      //     .getPositionLineData(Provider.of<HomeViewModel>(
                      //     context,
                      //     listen: false)
                      //     .dataTransportationLines[index]
                      //     .id);
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
                                    // Provider.of<HomeViewModel>(context,
                                    //     listen: false)
                                    //     .dataTransportationLinesSearch[
                                    // index]
                                    //     .name,
                                    "line1",
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
                                                  // Provider.of<HomeViewModel>(
                                                  //     context,
                                                  //     listen: false)
                                                  //     .dataTransportationLinesSearch[
                                                  // index]
                                                  //     .from!
                                                  //     .name,
                                                  "line1",
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
                                                  // Provider.of<HomeViewModel>(
                                                  //     context,
                                                  //     listen: false)
                                                  //     .dataTransportationLinesSearch[
                                                  // index]
                                                  //     .to!
                                                  //     .name,
                                                  "line1",
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
          ),
        ],
      ),
    );
  }
}
