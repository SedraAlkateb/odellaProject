import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';
import 'package:untitled/presentation/component/icon_notification.dart';
import 'package:untitled/presentation/page/add_lost_item/view_model/add_lost_item_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

import '../../../../lang/locale_keys.g.dart';
import '../../../not_viewmodel.dart';


class AddLostItemView extends StatefulWidget {
  const AddLostItemView({super.key});

  @override
  _AddLostItemViewState createState() => _AddLostItemViewState();
}

class _AddLostItemViewState extends State<AddLostItemView> {
  TextEditingController textEditingController = TextEditingController();
  int dropdownTransportationLine = 0;
  var viewModel;

  @override
  void initState() {
    viewModel=Provider.of<AddLostItemViewModel>(context,listen: false);
    viewModel.start();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String imageURL = 'assets/images/Screenshot 2023-05-20 100205.png';

    return Sizer(
      builder: (context, orientation, deviceType) {
        return SafeArea(
          child: Consumer<AddLostItemViewModel>(
            builder: (context, model, child) =>
                Scaffold(
                  appBar: AppBar(
                    title:  Text(
                      LocaleKeys.addlostitem.tr(),
                      style: TextStyle(
                          color: ColorManager.sidBarIcon,
                          fontSize: FontSize.s18
                      ),
                    ),
                    actions: [
                      notificationIcon(context)
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: orientation == Orientation.portrait
                        ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.sp),
                          child: TextField(
                            controller: textEditingController,
                            maxLines: 10,
                            //textDirection: TextDirection.,
                            decoration: InputDecoration(
                              hintText: LocaleKeys.descriptionlostitem.tr(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.w, color: ColorManager.sidBar),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.5.w, color: Colors.grey),
                              ),
                            ),
                            onChanged: (value){
                              // if (value.isEmpty) {
                              //   textEditingController.value = TextEditingValue.empty;
                              // }
                              // model.setDescription(value);
                              // textEditingController.text=value;
                              Provider.of<AddLostItemViewModel>(context,listen: false).setDescription(value);
                            },
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${LocaleKeys.enterimage.tr()}'':' ,
                              style: TextStyle(fontSize: AppSize.s18),),
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              child:
                              model.getImage() !=
                                  null
                                  ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppPadding.p50),
                                child: InkWell(
                                  onTap: () => model
                                      .setImageFromGallory(),
                                  child: Container(
                                      width: 160.0,
                                      height: 160.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.grey[300],
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(
                                              model
                                                  .getImage()!,
                                            ),
                                          ))),
                                ),
                              )
                                  : Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppPadding.p50),
                                child: InkWell(
                                  onTap: () => model
                                      .setImageFromGallory(),
                                  child:
                                  Container(
                                    width: 20.w,
                                    height: 20.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300],
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: AppSize.s50,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                              //  profile1.getDownload()
                              //:profile1.getLocalPath()!=null?
                            ),
                          ],
                        ),

                        SizedBox(height: 2.h),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${LocaleKeys.selecttrip.tr()}'':',
                              style: TextStyle(fontSize: AppSize.s20),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            DropdownButton(
                                hint:Text("date trip") ,
                                items:model.getTrip()
                                    .map((e) => DropdownMenuItem(
                                  value: e.id,
                                  child: Text(
                                    "${model.data( e.time!.date)} ${e.time!.start}",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: AppSize.s15),
                                  ),
                                )).toList(),
                                onChanged: (val) {
                                  model.setTripId(val!);
                                }
                            ),
                          ],
                        ),

                        SizedBox(height: 2.h),
                        ElevatedButton(
                          onPressed: () {
                            model.storeClaim();
                          },
                          child: Text(
                            LocaleKeys.send.tr(),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                            model.getMessage1()
                        ),
                        SizedBox(height: 5.h),
                      ],
                    )
                        : Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${LocaleKeys.enterimage.tr()}'':' ,
                                    style: TextStyle(fontSize: AppSize.s18),),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Container(
                                    child:
                                    model.getImage() !=
                                        null
                                        ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: AppPadding.p50),
                                      child: InkWell(
                                        onTap: () => model
                                            .setImageFromGallory(),
                                        child: Container(
                                            width: 160.0,
                                            height: 160.0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                color: Colors.grey[300],
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: FileImage(
                                                    model
                                                        .getImage()!,
                                                  ),
                                                ))),
                                      ),
                                    )
                                        : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: AppPadding.p50),
                                      child: InkWell(
                                        onTap: () => model
                                            .setImageFromGallory(),
                                        child:
                                        Container(
                                          width: 20.w,
                                          height: 20.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.grey[300],
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            size: AppSize.s50,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //  profile1.getDownload()
                                    //:profile1.getLocalPath()!=null?
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${LocaleKeys.selecttrip.tr()}'':',
                                    style: TextStyle(fontSize: AppSize.s20),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  DropdownButton(
                                      value: dropdownTransportationLine,
                                      items:model.getTrip()
                                          .map((e) => DropdownMenuItem(
                                        value: e.id,
                                        child: Text(
                                          "${model.data( e.time!.date)} ${ e.time!.start}",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: AppSize.s15),
                                        ),
                                      )).toList(),
                                      onChanged: (val) {
                                        model
                                            .setTripId(val!);
                                      }
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Text(
                                "data 1",
                                style: TextStyle(
                                    fontSize: AppSize.s15, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Text("data 2",
                                  style: TextStyle(
                                      fontSize: AppSize.s15,
                                      color: Colors.grey)),
                              SizedBox(
                                height: 1.h,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text(LocaleKeys.send.tr())),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: TextField(
                                controller: textEditingController,
                                maxLines: 10,
                                decoration: InputDecoration(
                                  hintText: LocaleKeys.descriptionlostitem.tr(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.w, color: ColorManager.sidBar),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5.w, color: Colors.grey
                                    ),
                                  ),

                                ),
                                onChanged: (value){Provider.of<AddLostItemViewModel>(context,listen: false).setDescription(value);
                                textEditingController.text=value;
                                }                        ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        );
      },
    );
  }
}
