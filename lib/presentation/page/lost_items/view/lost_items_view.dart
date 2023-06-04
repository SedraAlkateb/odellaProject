
import 'dart:io';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/common/image/downloadImage.dart';
import 'package:untitled/presentation/page/lost_items/view_model/lost_items_viewmodle.dart';
import 'package:untitled/presentation/resources/assets_manager.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
class LostItemsView extends StatefulWidget {
  const LostItemsView({Key? key}) : super(key: key);

  @override
  State<LostItemsView> createState() => _LostItemsViewState();
}

class _LostItemsViewState extends State<LostItemsView> {
  LostItemsViewModel lostItemsViewModel=instance<LostItemsViewModel>();
  @override
  void dispose() {
    lostItemsViewModel.dispose();
    super.dispose();
  }
  @override
void initState() {
Provider.of<LostItemsViewModel>(context,listen: false).start();
    super.initState();
  }
    Widget build(BuildContext context) {
      return Scaffold(
          body:
          contentWidget()
      );

    }

    Widget contentWidget(){
  //    if(Provider.of<HomeViewModel>(context).getIsPos()){
    //    WidgetsBinding.instance.addPostFrameCallback((_) {
     //     Provider.of<HomeViewModel>(context,listen: false).setIsPos(false);
      //    _navigator.pushNamed(Routes.mapPositionRoute);
      //  });
     // }
      return  Column(

          children: [

            Padding(
              padding:
              const EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20,bottom: AppPadding.p20),
              child: TextFormField(
                onChanged: (value)  {
                  try {
                    Provider.of<LostItemsViewModel>(context,listen: false).setSearch(value);
                  } catch (e, s) {
                    print(s);
                  }

                },
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300,width: AppSize.s1_5),
                    borderRadius:const BorderRadius.all(Radius.circular(AppSize.s16),),

                  ),
                  // fillColor: ColorManager.white,
                  border: OutlineInputBorder(
                    //  borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
                    borderSide: BorderSide(color: ColorManager.shadow, width: AppSize.s1_5),
                  ),
                  hintStyle: getRegularStyle(color: ColorManager.icon,fontSize: FontSize.s16),
                  hintText: StringsManager.search,
                  //       hintStyle:Theme.of(context).textTheme.bodySmall,
                  prefixIcon:  Padding(
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
                child:
                Provider.of<LostItemsViewModel>(context).getSearch()?.length == 0
                    ? Center(
                  child: Text(
                    "No result found",
                    style: TextStyle(
                        color: ColorManager.shadow,
                        fontSize: FontSize.s22,
                        fontWeight: FontWeight.bold),
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28,right: AppPadding.p28,bottom: AppPadding.p28),
                  child:
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,

                    itemCount: Provider.of<LostItemsViewModel>(context,listen: false).search.length,
                    itemBuilder: (context, index) =>
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Provider.of<LostItemsViewModel>(context).getSearch()?[index].description ??"",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:Theme.of(context).textTheme.labelLarge,
                            ),Center(
                              child: FadeInImage.assetNetwork(
                                placeholder:ImageAssets.leftArrowIc , // الصورة المؤقتة
                                image:  ImageDownloader.getUrl(
                                    Provider.of<LostItemsViewModel>(context)
                                        .getListFound()?[index].image??""),// الصورة الفعلية
                                fit: BoxFit.cover,
                                imageErrorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.grey, // الخلفية البديلة
                                    ),
                                  );
                                },
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                              ),
                            ),

                          ],
                        ),
                  ),
                ))
          ]);
    }
  }

