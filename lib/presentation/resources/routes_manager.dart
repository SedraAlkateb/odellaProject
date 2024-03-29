
import 'package:flutter/material.dart';
import 'package:untitled/allNotificationDetail.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/notification_details.dart';
import 'package:untitled/notification_list.dart';
import 'package:untitled/presentation/after_signup/view/after_signup.dart';
import 'package:untitled/presentation/after_splash/view/after_splash_view.dart';
import 'package:untitled/presentation/back_login/back_login.dart';
import 'package:untitled/presentation/base_home/view/base_home_view.dart';
import 'package:untitled/presentation/befor_signup/view/algorithem_view.dart';
import 'package:untitled/presentation/change_password/view/change_pass_view.dart';
import 'package:untitled/presentation/daily_recerviton/view/info_daily_recervition.dart';
import 'package:untitled/presentation/daily_recerviton/view/trip_daily_recervition_view.dart';
import 'package:untitled/presentation/daily_reser_map/view/daily_reser_map_view.dart';
import 'package:untitled/presentation/forget_password/view/forget_password_view.dart';
import 'package:untitled/presentation/login/view/login_view.dart';
import 'package:untitled/presentation/mm.dart';
import 'package:untitled/presentation/number/number_view.dart';
import 'package:untitled/presentation/page/add_lost_item/view/add_lost_item_view.dart';
import 'package:untitled/presentation/page/complaints/view/complaints_view.dart';
import 'package:untitled/presentation/page/home/view/home_view.dart';
import 'package:untitled/presentation/page/lost_items/view/lost_items_view.dart';
import 'package:untitled/presentation/page/page_view.dart';
import 'package:untitled/presentation/page/polylinee.dart';
import 'package:untitled/presentation/page/position/view/polyline_view.dart';
import 'package:untitled/presentation/page_superviser/map_position_supervisor/view/position_supervisor_view.dart';
import 'package:untitled/presentation/page_superviser/page_view.dart';
import 'package:untitled/presentation/page_superviser/supervisor_gps/supervisor_gps.dart';
import 'package:untitled/presentation/page_superviser/trip_information/view/trip_information_view.dart';
import 'package:untitled/presentation/qrCode/view/qr_code_view.dart';
import 'package:untitled/presentation/reset_password/view/reset_password_view.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/scan_qr_view/view/scan_qr_view.dart';
import 'package:untitled/presentation/settings/view/settings_view.dart';
import 'package:untitled/presentation/signup/view/signUp_view.dart';
import 'package:untitled/presentation/splash/splash_view.dart';
import 'package:untitled/presentation/subscription/view/subscription_view.dart';

import '../../main.dart';


class Routes {
  static const String sedra = "/sedra";

  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String storeDetailRoute = "/storeDetail";
  static const String afterSplashRoute = "/afterSplash";
  static const String signupRoute = "/signup";
  static const String signup1Route = "/signup1";
  static const String subscriptionRoute = "/subscription";

  static const String qrCodeViewRoute = "/QrCodeView";

  static const String afterSignUp = "/afterSignUp";
  static const String homeScreen = "/homeScreen";
  static const String baseHomeScreen = "/baseHomeScreen";
  static const String algorithem = "/algorithem";

  static const String pageScreen = "/pageScreen";
  static const String settingRoute = "/setting";
  static const String lostItemsRoute = "/lostItems";
  static const String complaintsRoute = "/complaints";
  static const String supervisorPageRoute = "/supervisorPage";
  static const String map = "/map";
  static const String resetPasswordRoute = "/resetPassword";
  static const String mmm = "/mmm";
  static const String addLostItemRoute = "/addLostItem";
  static const String polyLineDailyView = "/polyLineDailyView";
  static const String phone = "/phone";


  static const String polyLineRoute = "/PolyLine";
  static const String informationTrip = "/informationTripRoute";
  static const String notification_message = "/notificationMessage";
  static const String mapline = "/mapline";
  static const String changepass = "/changepass";

  static const String display_image = "/displayimage";
  static const String application = "/application";
  static const String notMessage = "/notMessage";
  static const String notMessageRealTime = "/notMessageRealTime";

  static const String polyline = "/polyline";
  static const String qrscan = "/qrscan";
  static const String compandrat = "/compandrat";
  static const String dailyReservation = "/dailyReservation";
  static const String dailyReservationInfo = "/dailyReservationInfo";
  static const String backToLogin = "/backToLoginView";



}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.phone:
        initPhone();
        return MaterialPageRoute(builder: (_) => const NumberView());
      case Routes.algorithem:
        initAlgorithmModule();
        return MaterialPageRoute(builder: (_) =>  const SelectTimes());
      case Routes.polyLineDailyView:
        initDailyReservationMap();
        return MaterialPageRoute(builder: (_) => const PolyLineDailyView());
      case Routes.backToLogin:
        return MaterialPageRoute(builder: (_) => const BackLoginView());

      case Routes.dailyReservation:
        initDailyReservation();
        return MaterialPageRoute(builder: (_) => const TripDailyReservationView());
      case Routes.application:
        initNotificationModule();
        return MaterialPageRoute(builder: (_) => const Application());
      case Routes.notMessage:
        return MaterialPageRoute(builder: (_) =>  const NotMessageView());
      case Routes.notMessageRealTime:
        return MaterialPageRoute(builder: (_) =>  const MessageView());
      case Routes.informationTrip:
        return MaterialPageRoute(builder: (_) => const TripInformationView());
      case Routes.addLostItemRoute:
        initAddLostModule();
        return MaterialPageRoute(builder: (_) => const AddLostItemView());
      case Routes.afterSplashRoute:
        return MaterialPageRoute(builder: (_) => const AfterSplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.forgotPasswordRoute:
        initForgetPassword();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
        case Routes.signupRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => SignUpView());
      case Routes.afterSignUp:
        return MaterialPageRoute(builder: (_) => const AfterSignUpView());
      case Routes.subscriptionRoute:
        initSubscriptionModule();
        return MaterialPageRoute(builder: (_) => const SubscriptionsView());
      case Routes.resetPasswordRoute:
        initResetPasswordModule();
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
     case Routes.pageScreen:
       initNotificationModule();
       initHomeModule();
        initLogoutModule();
        initProfileModule();
        initProgramModule();
        initLostAndFoundModule();
        initClaimModule();
        initTripSupervisorModule();
        return MaterialPageRoute(builder: (_) => const PagesView());
      case Routes.homeScreen:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.baseHomeScreen:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const TransportationLinesView());
       case Routes.settingRoute:
         return MaterialPageRoute(builder: (_) => const SettingsView());
      case Routes.lostItemsRoute:
        return MaterialPageRoute(builder: (_) => const LostItemsView());
      case Routes.complaintsRoute:
        return MaterialPageRoute(builder: (_) => const ComplaintsView());
      case Routes.map:
        return MaterialPageRoute(builder: (_) =>  MapPage());
      case Routes.qrCodeViewRoute:
        return MaterialPageRoute(builder: (_) =>  QrCodeView());
      case Routes.notification_message:
        return MaterialPageRoute(builder: (_) =>  MessageList());
      case Routes.polyLineRoute:
        return MaterialPageRoute(builder: (_) =>  PolyLineView());
      case Routes.changepass:
        initChangePasswordModule();
        return MaterialPageRoute(builder: (_) =>  ChangePassView());
      case Routes.qrscan:
        return MaterialPageRoute(builder: (_) => QRScanScreen());
      case Routes.polyline:
        return MaterialPageRoute(builder: (_) => Polylinee());
      case Routes.compandrat:
        return MaterialPageRoute(builder: (_) => ComplaintsView());

      case Routes.mmm:
        return MaterialPageRoute(builder: (_) =>  mmm());
      case Routes.supervisorPageRoute:
        initNotificationModule();
        initProfileSupervisorModule();
        initLogoutSupervisorModule();
        initHomeSupervisorModule();
        initProgramModule();
        initScanQrModule();
        initdailyReservationsModule();
        return MaterialPageRoute(builder: (_) => const SupervisorPagesView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                    StringsManager.noRouteFound), // string to strings manager
              ),
              body: const Center(
                  child: Text(
                      StringsManager.noRouteFound)), //string to strings manager
            ));
  }
}

