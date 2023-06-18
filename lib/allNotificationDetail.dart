
// ignore_for_file: require_trailing_commas

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/not_viewmodel.dart';

/// Displays information about a [RemoteMessage].
class MessageDetailView extends StatelessWidget {
  const MessageDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Not>(
      builder: (context, model, child) =>
       Scaffold(
        appBar: AppBar(
          title: appbar(model.getMessage().body),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // img(
                          //   notification.android!.imageUrl,
                          // ),
                          const Text(
                            'Notification Information :',
                            style: TextStyle(fontSize: 18),
                          ),
                          viewData(
                            'Title',
                            model.getMessage().title,
                          ),
                          viewData(
                            'Body',
                            model.getMessage().body,
                          ),
                        ],
                      ),
                    )
                ],
              ),
            )),
      ),
    );
  }

  /// A single data row.
  Widget viewData(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '$title: ',style: const TextStyle(fontWeight: FontWeight.bold)
          ),
          Expanded(
            child: Text(value ?? 'N/A',),
          ),
        ],
      ),
    );
  }

  Widget img(String? value) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        child: Center(
          child: Image.network(
            value ?? 'https://img.icons8.com/bubbles/2x/appointment-reminders.png',
            height: 200,
            width: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget appbar(String? value) {
    return Text(value ?? 'N/A',style: const TextStyle(fontSize: 16),);
  }

}
