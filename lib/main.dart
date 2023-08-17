import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/app.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/lang/codegen_loader.g.dart';
import 'package:untitled/presentation/component/icon_notification.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/language_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:untitled/config-firebase.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'notification_details.dart';
import 'notification_list.dart';

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    /// ToDO change your data ///
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBwR_ZmMpjY_27e7En7Oad0AXTciWOkcLY',
      appId: '1:488432009966:android:d1a85bdd3cf111d59fe9ff',
      messagingSenderId: '488432009966',
      projectId: 'odella-f86e7',
    ),
  );
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  Provider.debugCheckInvalidValueType=null;
  ByteData  data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      // 'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
   //runApp(const MessagingExampleApp());
  runApp(
    EasyLocalization(
      child: Phoenix(child: MyApp()),
      supportedLocales: const [ARABIC_LOCALE, ENGLISH_LOCALE],
      assetLoader:const CodegenLoader(),
      fallbackLocale: ENGLISH_LOCALE,
      path: ASSET_PATH_LOCALISATION),
  );
}


/// Renders the example application.
class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Application();
}

class _Application extends State<Application> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void getToken() async {
    final token =
    _firebaseMessaging.getToken().then((value) =>
        print('Token:///////////////////////////////////////////////////////////........... $value'));
  }

  @override
  void initState() {
    super.initState();
    getToken();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Navigator.pushNamed(
          context,
          Routes.notMessageRealTime,
          arguments: MessageArguments(message, true),
        );
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // channel.description,

              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Navigator.pushNamed(
        context,
        Routes.notMessageRealTime,
        arguments: MessageArguments(message, true),
);
});
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: ColorManager.sidBar,
      toolbarHeight: 60,
      title: const Text('Notifications'),

      leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
        Navigator.pop(context);
      },),

      actions: [
        notificationIcon(context)
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        children:  [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color:Colors.grey.shade300,
                  child: InkWell(child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("make all as read",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                  ) ,
                    onTap: (){
                      Provider.of<Not>(context,listen: false).getAllNotificationRead();
                    },
                  ),
                ),
              ],
            ),
          ),

          MessageList(),
        ],
      ),
    ),
  );
}
}
