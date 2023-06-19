
// ignore_for_file: require_trailing_commas

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/domain/models/models.dart';
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
  List<RemoteMessage> _messages = [];
  @override
  void initState() {
    super.initState();
    Provider.of<Not>(context,listen: false).start();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _messages = [..._messages, message];
        Provider.of<Not>(context,listen: false).updateInc();
        print( Provider.of<Not>(context,listen: false).getCount());
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              badgeContent: Text("${ Provider.of<Not>(context,listen: false).getCount()}",style: TextStyle(color: Colors.white),),

              child: Icon(Icons.notifications,size: AppSize.s30),
              badgeAnimation: BadgeAnimation.fade(animationDuration: Duration(milliseconds:250 )),
            ),
          ],
        ),
        ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              width: double.infinity,
              height: AppSize.s20,
              // color: Color,
            ),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              RemoteMessage message = _messages[index];
              return ListTile(
                title: Text(message.notification?.title ?? 'N/D',style:const TextStyle(fontWeight: FontWeight.bold),),
                subtitle:
                Text(message.sentTime?.toString() ?? DateTime.now().toString()),
                trailing: const Icon(Icons.notifications_active,color: Colors.red,),
                onTap: () {

                  setState(() {
                    if( Provider.of<Not>(context,listen: false).getCount()==0)
                      return;
                    Provider.of<Not>(context,listen: false).updateDec();
                  });

                    if( Provider.of<Not>(context).getCount()!=0) {
                      Provider.of<Not>(context, listen: false).updateDec();
                    }


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