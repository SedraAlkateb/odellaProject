import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';
import 'package:untitled/presentation/page/add_lost_item/view_model/add_lost_item_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/resources/values_manager.dart';


class AddLostItemView extends StatefulWidget {
  const AddLostItemView({super.key});

  @override
  _AddLostItemViewState createState() => _AddLostItemViewState();
}

class _AddLostItemViewState extends State<AddLostItemView> {
  TextEditingController textEditingController = TextEditingController();
  String dropdownTransportationLine = 't1';

  @override
  Widget build(BuildContext context) {
    String imageURL = 'assets/images/Screenshot 2023-05-20 100205.png';

    return Sizer(
      builder: (context, orientation, deviceType) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title:  Text(
                StringsManager.add_lost_item,
                style: TextStyle(
                    color: ColorManager.sidBarIcon,
                    fontSize: FontSize.s18
                ),
              ),
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
                      decoration: InputDecoration(
                        hintText: StringsManager.enter_description_lostitem,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.w, color: ColorManager.sidBar),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.5.w, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${StringsManager.enter_image}'':' ,
                        style: TextStyle(fontSize: AppSize.s18),),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        child:
                        Provider.of<AddLostItemViewModel>(context).getImage() !=
                            null
                            ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p50),
                          child: InkWell(
                            onTap: () => Provider.of<AddLostItemViewModel>(
                                context,
                                listen: false)
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
                                        Provider.of<AddLostItemViewModel>(
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
                            onTap: () => Provider.of<AddLostItemViewModel>(
                                context,
                                listen: false)
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${StringsManager.select_trip}'':',
                        style: TextStyle(fontSize: AppSize.s20),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      DropdownButton(
                        value: dropdownTransportationLine,
                        items: <String>[
                          't1',
                          't2',
                          't3',
                          't4'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SizedBox(
                              width: 8.w,
                              child: Text(
                                value,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: AppSize.s15),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownTransportationLine = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  const Text(
                    "data 1",
                    style: TextStyle(
                        fontSize: AppSize.s15, color: Colors.grey),
                  ),
                  SizedBox(height: 2.h),
                  const Text(
                    "data 2",
                    style: TextStyle(
                        fontSize: AppSize.s15, color: Colors.grey),
                  ),
                  SizedBox(height: 2.h),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<AddLostItemViewModel>(context,listen: false).storeClaim();
                    },
                    child: Text(
                      StringsManager.send,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                      Provider.of<AddLostItemViewModel>(context).getMasege()
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
                            Text('${StringsManager.enter_image}'':' ,
                              style: TextStyle(fontSize: AppSize.s18),),
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              child:
                                Provider.of<AddLostItemViewModel>(context).getImage() !=
                                null
                                ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: AppPadding.p50),
                              child: InkWell(
                                onTap: () => Provider.of<AddLostItemViewModel>(
                                    context,
                                    listen: false)
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
                                            Provider.of<AddLostItemViewModel>(
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
                                onTap: () => Provider.of<AddLostItemViewModel>(
                                    context,
                                    listen: false)
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
                              '${StringsManager.select_trip}'':',
                              style: TextStyle(fontSize: AppSize.s20),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            DropdownButton(
                              value: dropdownTransportationLine,
                              items: <String>['t1', 't2', 't3', 't4']
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: SizedBox(
                                        width: 8.w,
                                        child: Text(
                                          value,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: AppSize.s15),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownTransportationLine = newValue!;
                                });
                              },
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
                            child: Text(StringsManager.send)),
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
                          hintText: StringsManager.enter_description_lostitem,
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
                        onChanged:(value)=>Provider.of<AddLostItemViewModel>(context).setDescription(value),
                      ),
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
