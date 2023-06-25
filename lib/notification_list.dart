
// ignore_for_file: require_trailing_commas

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/lang/locale_keys.g.dart';
import 'package:untitled/presentation/component/icon_notification.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import 'package:untitled/presentation/resources/values_manager.dart';

import 'notification_details.dart';
import 'package:badges/badges.dart';

/// Listens for incoming foreground messages and displays them in a list.
class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageList();
}

class _MessageList extends State<MessageList> {

  @override
  void initState() {
    super.initState();
    Provider.of<Not>(context,listen: false).start();
    Provider.of<Not>(context,listen: false).updateMassages();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 1.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color:Colors.grey.shade300,
                    child: InkWell(child: Text(LocaleKeys.makeallread.tr(),))),
              ],
            ),

          ),
          SizedBox(height: 3.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 1.w,),
              Text(LocaleKeys.neww.tr(),
              style: getBoldStyle(color: Colors.black,fontSize: FontSize.s18),),
            ],
          ),
          ListView.separated(
            itemCount: Provider.of<Not>(context).getMessageL(),
            itemBuilder: (context, index) {
              RemoteMessage message = Provider.of<Not>(context,listen: false).getMessageIndex(index);
              return ListTile(
                title: Text(message.notification?.title ?? 'N/D',style:const TextStyle(fontWeight: FontWeight.bold),),
                subtitle:
                Text(message.sentTime?.toString() ?? DateTime.now().toString()),
                trailing: const Icon(Icons.circle,color: Colors.red,),
                onTap: () {
                    if( Provider.of<Not>(context).getCount()!=0) {
                      Provider.of<Not>(context, listen: false).updateDec();
                    }
                  Navigator.pushNamed(context, '/message',
                    arguments: MessageArguments(message, false),);
                }
              );
            }),
        Consumer<Not>(
          builder: (context, model, child) =>
           ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(
                width: double.infinity,
                height: AppSize.s20,
                // color: Color,
              ),
              //itemCount: _messages.length,
              itemCount: Provider.of<Not>(context).getMessageL(),
              itemBuilder: (context, index) {
                //RemoteMessage message = _messages[index];
                RemoteMessage message = Provider.of<Not>(context,listen: false).getMessageIndex(index);
                return GestureDetector(
                  onTap: ()
                  {
                  if( Provider.of<Not>(context).getCount()!=0) {
                            Provider.of<Not>(context, listen: false).updateDec();
                          }

                        Navigator.pushNamed(context, '/message',
                          arguments: MessageArguments(message, false),);
                  },
                  child: Container(
                   // color: ColorManager.sidBar,
                    child: Padding(
                      padding:  EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 1.h,),
                          Text(message.notification?.title ?? 'N/D',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: FontSize.s18),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Icon(Icons.circle,color: Colors.redAccent,),],
                          ),
                          Text(message.sentTime?.toString() ?? DateTime.now().toString()),

                        ],
                      ),
                    ),
                  ),
                );
                // return Container(
                //   color: ColorManager.sidBar,
                //   child: ListTile(
                //
                //     title: Text(message.notification?.title ?? 'N/D',style:const TextStyle(fontWeight: FontWeight.bold),),
                //     subtitle:
                //     Text(message.sentTime?.toString() ?? DateTime.now().toString()),
                //     trailing: const Icon(Icons.circle,color: Colors.red,),
                //     onTap: () {
                //
                //         if( Provider.of<Not>(context).getCount()!=0) {
                //           Provider.of<Not>(context, listen: false).updateDec();
                //         }
                //
                //       Navigator.pushNamed(context, '/message',
                //         arguments: MessageArguments(message, false),);
                //
                //     }
                //   ),
                // );
              }),
          SizedBox(height: 3.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 1.w,),
              Text(LocaleKeys.earlier.tr(),
                style: getBoldStyle(color: Colors.black,fontSize: FontSize.s18),),
            ],
          ),
          Consumer<Not>(
            builder: (context, model, child) =>
             ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  width: double.infinity,
                  height: AppSize.s20,
                  // color: Color,
                ),
                itemCount: model.getNotification().length,
                itemBuilder: (context, index) {
                  NotificationModel message = model.getNotification()[index];
                  return GestureDetector(
                    onTap: ()
                    {
                      Navigator.pushNamed(context, Routes.message);
                    },
                    child: Container(
                      color: ColorManager.sidBar,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 1.h,),
                          Text(message.title,style:const TextStyle(fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Icon(Icons.circle,color: Colors.redAccent,),],
                          ),
                          Text(message.body),

                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),

        ],
      ),
    );

  }
}