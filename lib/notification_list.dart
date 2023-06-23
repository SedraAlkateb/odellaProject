
// ignore_for_file: require_trailing_commas

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/presentation/component/icon_notification.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
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

    return Column(
      children: [
        InkWell(child: Text("make all as read")),
        ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              width: double.infinity,
              height: AppSize.s20,
              // color: Color,
            ),

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
              itemCount: model.getNotification().length,
              itemBuilder: (context, index) {
                NotificationModel message = model.getNotification()[index];
                return ListTile(
                    title: Text(message.title,style:const TextStyle(fontWeight: FontWeight.bold),),
                    subtitle:
                    Text(message.body),
                    trailing: const Icon(Icons.notifications_active,color: Colors.red,),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.messageDetail1);

                    }
                );
              }),
        ),

      ],
    );

  }
}