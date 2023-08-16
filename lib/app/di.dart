
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/data/data_source/remote_data_source.dart';
import 'package:untitled/data/network/app_api.dart';
import 'package:untitled/data/network/dio_factory.dart';
import 'package:untitled/data/network/network_info.dart';
import 'package:untitled/data/network/pusher.dart';
import 'package:untitled/data/repository/repository.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/Universities_usecase.dart';
import 'package:untitled/domain/usecase/approve_usecase.dart';
import 'package:untitled/domain/usecase/areas_usecase.dart';
import 'package:untitled/domain/usecase/cities_usecase.dart';
import 'package:untitled/domain/usecase/confirm_qr_usecase.dart';
import 'package:untitled/domain/usecase/daily_reservations_usecase.dart';
import 'package:untitled/domain/usecase/deny_usecase.dart';
import 'package:untitled/domain/usecase/evaluation_usecase.dart';
import 'package:untitled/domain/usecase/forget_password_usecase.dart';
import 'package:untitled/domain/usecase/get_all_lost_usecase.dart';
import 'package:untitled/domain/usecase/home_supervisor_usecase.dart';
import 'package:untitled/domain/usecase/login_usecase.dart';
import 'package:untitled/domain/usecase/logout_usecase.dart';
import 'package:untitled/domain/usecase/not_read_all_usecase.dart';
import 'package:untitled/domain/usecase/not_read_by_id_usecase.dart';
import 'package:untitled/domain/usecase/notification_usecase.dart';
import 'package:untitled/domain/usecase/position_line_usecase.dart';
import 'package:untitled/domain/usecase/posts_usecase.dart';
import 'package:untitled/domain/usecase/profile_usecase.dart';
import 'package:untitled/domain/usecase/programs_usecase.dart';
import 'package:untitled/domain/usecase/refresh_usecase.dart';
import 'package:untitled/domain/usecase/reset_password_usecase.dart';
import 'package:untitled/domain/usecase/signup_usecase.dart';
import 'package:untitled/domain/usecase/store_claim_usecase.dart';
import 'package:untitled/domain/usecase/store_lost_usecase.dart';
import 'package:untitled/domain/usecase/student_attendence_usecase.dart';
import 'package:untitled/domain/usecase/student_position_usecase.dart';
import 'package:untitled/domain/usecase/subscriptions_usecase.dart';
import 'package:untitled/domain/usecase/supervisor_update_position_usecase.dart';
import 'package:untitled/domain/usecase/today_trips_usecase.dart';
import 'package:untitled/domain/usecase/transfer_positions_usecase.dart';
import 'package:untitled/domain/usecase/transportation_lines_usecase.dart';
import 'package:untitled/domain/usecase/tt.dart';
import 'package:untitled/domain/usecase/update_image_usecase.dart';
import 'package:untitled/domain/usecase/update_password_usecase.dart';
import 'package:untitled/domain/usecase/update_student_usecase.dart';
import 'package:untitled/domain/usecase/update_supervisor_image_usecase.dart';
import 'package:untitled/domain/usecase/update_supervisor_password_usecase.dart';
import 'package:untitled/domain/usecase/update_supervisor_usecase.dart';
import 'package:untitled/domain/usecase/user_daily_reservations_usecase.dart';
import 'package:untitled/domain/usecase/weekly_trips_usecase.dart';
import 'package:untitled/presentation/base_home/view_model/base_home_view_model.dart';
import 'package:untitled/presentation/daily_recerviton/view_model/daily_reservation%20_viewmodel.dart';
import 'package:untitled/presentation/daily_reser_map/view_model/daily_reser_map_viewmodel.dart';
import 'package:untitled/presentation/forget_password/view_model/forget_password_viewmodel.dart';
import 'package:untitled/presentation/login/view_model/login_viewmodel.dart';
import 'package:untitled/presentation/map_position/view_model/map_position_view_model.dart';
import 'package:untitled/presentation/not_viewmodel.dart';
import 'package:untitled/presentation/notification/view_model/notification_viewmodel.dart';
import 'package:untitled/presentation/page/add_lost_item/view_model/add_lost_item_viewmodel.dart';
import 'package:untitled/presentation/page/complaints/view_model/complaints_viewmodel.dart';
import 'package:untitled/presentation/page/drawer/view/drawer_viewmodel.dart';
import 'package:untitled/presentation/page/home/view_model/home_view_model.dart';
import 'package:untitled/presentation/page/lost_items/view_model/lost_items_viewmodle.dart';
import 'package:untitled/presentation/page/profile/view_model/profile_view_model.dart';
import 'package:untitled/presentation/page/program/view_model/programs_viewmodel.dart';
import 'package:untitled/presentation/page/supervisor_trip/view_model/supervisor_trip_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/daily_recieve/view_model/daily_recieve_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/drawer/view_model/drawer_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/home_supervisor/view_model/home_super_viewmodel.dart';
import 'package:untitled/presentation/page_superviser/profile/view_model/supervisor_profile_viewmodel.dart';
import 'package:untitled/presentation/reset_password/view_model/reset_password_viewmodel.dart';
import 'package:untitled/presentation/scan_qr_view/view_model/scan_qr_viewmodel.dart';
import 'package:untitled/presentation/signup/view_model/signup_view_model.dart';
import 'package:untitled/presentation/subscription/view_model/subscription_view_model.dart';

GetIt instance=GetIt.instance;

Future<void>initAppModule()async{
  //app module itd a module where are put all generic dependencies
  //shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() =>
  sharedPrefs);
  //app prefs instance
  instance.registerLazySingleton<AppPreferences>(() =>
      AppPreferences(instance()));
  //network info instance
  instance.registerLazySingleton<NetworkInfo>(() =>
      NetWorkInfoImpl(InternetConnectionChecker()));
  instance.registerLazySingleton<DioFactory>(() =>
      DioFactory(instance()));
  instance.registerLazySingleton<PusherTrip>(() =>
      PusherTrip(instance()));
  Dio dio =await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() =>
      AppServiceClient(dio));

  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(() =>
      RemoteDataSourceImpl(instance<AppServiceClient>()));
  //repository
  instance.registerLazySingleton<Repository>(() =>
      RepositoryImp(
          instance()) );
}
Future<void>initLoginModule() async{
  if(!GetIt.I.isRegistered<LoginUseCase>()){
    instance.registerFactory<LoginUseCase>(() =>LoginUseCase(instance()));
    instance.registerFactory<RefreshUseCase>(() =>RefreshUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() =>LoginViewModel(instance(),instance()));

  }

}
Future<void>initDailyReservation() async{
  if(!GetIt.I.isRegistered<TodayTripsUseCase>()){
    instance.registerFactory<TodayTripsUseCase>(() =>TodayTripsUseCase(instance()));
    instance.registerFactory<DailyReservationViewModel>(() =>DailyReservationViewModel(instance()));

  }

}
Future<void>initDailyReservationMap() async{
  if(!GetIt.I.isRegistered<UserDailyReservationsUseCase>()){
    instance.registerFactory<UserDailyReservationsUseCase>(() =>UserDailyReservationsUseCase(instance()));
    instance.registerFactory<DailyReservationMapViewModel>(() =>DailyReservationMapViewModel(instance()));

  }

}
Future<void>initSubscriptionModule() async{
  if(!GetIt.I.isRegistered<SubscriptionsUseCase>()) {
    instance.registerFactory<SubscriptionsUseCase>(() =>
        SubscriptionsUseCase(instance()));
  }
  if(!GetIt.I.isRegistered<SubscriptionViewModel>()){

    instance.registerFactory<SubscriptionViewModel>(() =>SubscriptionViewModel(instance()));
  }
}

Future<void>initClaimModule() async{
  if(!GetIt.I.isRegistered<StoreClaimUseCase>()) {
    instance.registerFactory<StoreClaimUseCase>(() =>
        StoreClaimUseCase(instance()));
    instance.registerFactory<WeeklyTripUsecase>(() =>
        WeeklyTripUsecase(instance()));
    instance.registerFactory<EvaluationUseCase>(() =>EvaluationUseCase(instance()));

    instance.registerFactory<ComplaintsViewModel>(() =>ComplaintsViewModel(instance(),instance(),instance()));
  }
}
Future<void>initAddLostModule() async{
  if(!GetIt.I.isRegistered<StoreLostUseCase>()) {
    instance.registerFactory<StoreLostUseCase>(() =>
        StoreLostUseCase(instance()));
    if(!GetIt.I.isRegistered<WeeklyTripUsecase>()) {
      instance.registerFactory<WeeklyTripUsecase>(() =>
          WeeklyTripUsecase(instance()));
    }
    instance.registerFactory<AddLostItemViewModel>(() =>AddLostItemViewModel(instance(),instance()));
  }
}
Future<void>initResetPasswordModule() async{
  if(!GetIt.I.isRegistered<ResetPasswordUseCase>()) {
    instance.registerFactory<ResetPasswordUseCase>(() =>
        ResetPasswordUseCase(instance()));
    instance.registerFactory<ResetPasswordViewModel>(() =>ResetPasswordViewModel(instance()));
  }
}

Future<void>initdailyReservationsModule() async{
  if(!GetIt.I.isRegistered<DailyReservationUseCase>()) {
    instance.registerFactory<DailyReservationUseCase>(() =>
        DailyReservationUseCase(instance()));
    instance.registerFactory<ApproveUseCase>(() =>
        ApproveUseCase(instance()));
    instance.registerFactory<DenyUseCase>(() =>
        DenyUseCase(instance()));
    instance.registerFactory<DailyReservationsViewModel>(() =>DailyReservationsViewModel(instance(),instance(),instance()));
  }
}
Future<void>initHomeSupervisorModule() async{
  if(!GetIt.I.isRegistered<HomeSupervisorUseCase>()) {
    instance.registerFactory<HomeSupervisorUseCase>(() =>
        HomeSupervisorUseCase(instance()));}
  if(!GetIt.I.isRegistered<ConfirmQrUseCase>()) {
    instance.registerFactory<ConfirmQrUseCase>(() =>
        ConfirmQrUseCase(instance()));}
    if(!GetIt.I.isRegistered<HomeSuperVisorViewModel>()) {
      instance.registerFactory<StudentPositionUseCase>(() =>
          StudentPositionUseCase(instance()));
    instance.registerFactory<HomeSuperVisorViewModel>(() =>HomeSuperVisorViewModel(instance(),instance(),instance()));
  }
}
Future<void>initTripSupervisorModule() async{
  if(!GetIt.I.isRegistered<HomeSupervisorUseCase>()) {
    instance.registerFactory<HomeSupervisorUseCase>(() =>
        HomeSupervisorUseCase(instance()));
  }
    if(!GetIt.I.isRegistered<SupervisorTripViewModel>()) {
      instance.registerFactory<SupervisorTripViewModel>(() =>
          SupervisorTripViewModel(instance()));
    }
}

Future<void>initNotificationModule() async{
  if(!GetIt.I.isRegistered<NotificationUseCase>()) {
    instance.registerFactory<NotificationUseCase>(() =>
        NotificationUseCase(instance()));
    instance.registerFactory<ReadAllNotificationUseCase>(() =>
        ReadAllNotificationUseCase(instance()));
    instance.registerFactory<ReadNotificationByIdUseCase>(() =>
        ReadNotificationByIdUseCase(instance()));
    instance.registerFactory<Not>(() =>Not(instance(),instance(),instance()));
  }
}

Future<void>initScanQrModule() async{
  if(!GetIt.I.isRegistered<ConfirmQrUseCase>()) {
    instance.registerFactory<ConfirmQrUseCase>(() =>
        ConfirmQrUseCase(instance()));}
  if(!GetIt.I.isRegistered<ScanQrViewModel>()) {

    instance.registerFactory<ScanQrViewModel>(() =>ScanQrViewModel(instance()));
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<TransportationLinesUseCase>()) {
    instance.registerFactory<TransportationLinesUseCase>(() =>
        TransportationLinesUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<PositionLineUseCase>()) {
    instance.registerFactory<PositionLineUseCase>(() =>
        PositionLineUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<HomeViewModel>()) {
    instance.registerFactory<HomeViewModel>(() =>
        HomeViewModel(instance(), instance()));
  }
}

initProfileModule() {
  if (!GetIt.I.isRegistered<ProfileUseCase>()) {
    instance.registerFactory<ProfileUseCase>(() => ProfileUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<UpdateStudentUseCase>()) {
    instance.registerFactory<UpdateStudentUseCase>(() =>UpdateStudentUseCase(instance()));
    instance.registerFactory<UpdateStudenttUseCase>(() =>UpdateStudenttUseCase(instance()));
    instance.registerFactory<UpdatePasswordUseCase>(() =>UpdatePasswordUseCase(instance()));
    instance.registerFactory<UpdateImageUseCase>(() =>UpdateImageUseCase(instance()));
    if (!GetIt.I.isRegistered<AreasUseCase>()){
      instance.registerFactory<AreasUseCase>(() =>AreasUseCase(instance()));

    }
    if (!GetIt.I.isRegistered<CitiesUseCase>()){
      instance.registerFactory<CitiesUseCase>(() =>CitiesUseCase(instance()));

    }
    if (!GetIt.I.isRegistered<UniversitiesUsecase>()){
      instance.registerFactory<UniversitiesUsecase>(() =>UniversitiesUsecase(instance()));

    }
    if (!GetIt.I.isRegistered<SubscriptionsUseCase>()){
      instance.registerFactory<SubscriptionsUseCase>(() =>SubscriptionsUseCase(instance()));

    }
    instance.registerFactory<ProfileViewModel>(() => ProfileViewModel(instance(),instance(),instance(),instance(),
        instance(),instance(),instance(),instance(),instance()));
  }
}
//CitiesUseCase _citiesUseCase;
//   final AreasUseCase _areasUseCase;
//   final SubscriptionsUseCase _subscriptionsUseCase;
//   final UniversitiesUsecase _universitiesUsecase;
initProfileSupervisorModule() {
  if (!GetIt.I.isRegistered<ProfileUseCase>()) {
    instance.registerFactory<ProfileUseCase>(() => ProfileUseCase(instance()));
  }if (!GetIt.I.isRegistered<UpdateSupervisorUseCase>()) {
    if (!GetIt.I.isRegistered<AreasUseCase>()){
      instance.registerFactory<AreasUseCase>(() =>AreasUseCase(instance()));

    }
    if (!GetIt.I.isRegistered<CitiesUseCase>()){
      instance.registerFactory<CitiesUseCase>(() =>CitiesUseCase(instance()));

    }
    if (!GetIt.I.isRegistered<UniversitiesUsecase>()){
      instance.registerFactory<UniversitiesUsecase>(() =>UniversitiesUsecase(instance()));

    }
    if (!GetIt.I.isRegistered<SubscriptionsUseCase>()){
      instance.registerFactory<SubscriptionsUseCase>(() =>SubscriptionsUseCase(instance()));

    }
      instance.registerFactory<UpdateSupervisorUseCase>(() =>UpdateSupervisorUseCase(instance()));
    instance.registerFactory<UpdateSupervisorPasswordUseCase>(() =>UpdateSupervisorPasswordUseCase(instance()));
    instance.registerFactory<UpdateSupervisorImageUseCase>(() =>UpdateSupervisorImageUseCase(instance()));
    instance.registerFactory<SupervisorProfileViewModel>(() => SupervisorProfileViewModel(instance(),instance(),instance(),instance(),instance(),instance(),instance(),instance()));
  }
}
initLogoutModule() {
  if (!GetIt.I.isRegistered<LogoutUseCase>()) {
    instance.registerFactory<LogoutUseCase>(() => LogoutUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<DrawerViewModel>()){
    instance.registerFactory<DrawerViewModel>(() => DrawerViewModel(instance()));
  }
}
initLogoutSupervisorModule() {
  if (!GetIt.I.isRegistered<LogoutUseCase>()) {
    instance.registerFactory<LogoutUseCase>(() => LogoutUseCase(instance()));
  }  if (!GetIt.I.isRegistered<DrawerSupervisorViewModel>()) {
    instance.registerFactory<DrawerSupervisorViewModel>(() => DrawerSupervisorViewModel(instance()));
  }
}
initRegisterModule(){
  if(!GetIt.I.isRegistered<SubscriptionsUseCase>()) {
    instance.registerFactory<SubscriptionsUseCase>(() =>
        SubscriptionsUseCase(instance()));
  }
  if(!GetIt.I.isRegistered<TransportationLinesUseCase>()) {
    instance.registerFactory<TransportationLinesUseCase>(() =>
        TransportationLinesUseCase(instance()));
  }
  if(!GetIt.I.isRegistered<TransferPositionsUseCase>()) {
    instance.registerFactory<TransferPositionsUseCase>(() =>
        TransferPositionsUseCase(instance()));
  }
  if(!GetIt.I.isRegistered<UniversitiesUsecase>()) {
    instance.registerFactory<UniversitiesUsecase>(() =>
        UniversitiesUsecase(instance()));
  }
  if(!GetIt.I.isRegistered<PositionLineUseCase>()) {
    instance.registerFactory<PositionLineUseCase>(() =>
        PositionLineUseCase(instance()));
  }
  if(!GetIt.I.isRegistered<SignUpUseCase>()) {
    instance.registerFactory<SignUpUseCase>(() => SignUpUseCase(instance()));
    instance.registerFactory<SignUpViewModel>(() =>SignUpViewModel(instance(),instance(),instance(),instance(),instance(),instance(),instance(),instance()));

  }
  if(!GetIt.I.isRegistered<AreasUseCase>()) {
    instance.registerFactory<AreasUseCase>(() => AreasUseCase(instance()));
  }
  if(!GetIt.I.isRegistered<CitiesUseCase>()) {
    instance.registerFactory<CitiesUseCase>(() => CitiesUseCase(instance()));
  }

}
initProgramModule() {
  if (!GetIt.I.isRegistered<ProgramsUseCase>()) {
    instance.registerFactory<ProgramsUseCase>(() =>ProgramsUseCase(instance()));
    instance.registerFactory<StudentAttendenceUsecase>(() =>StudentAttendenceUsecase(instance()));
    instance.registerFactory<ProgramsViewModel>(() => ProgramsViewModel(instance(),instance()));
    }
}
initLostAndFoundModule() {
  if (!GetIt.I.isRegistered<GetAllLostUseCase>()) {
    instance.registerFactory<GetAllLostUseCase>(() =>GetAllLostUseCase(instance()));
    instance.registerFactory<LostItemsViewModel>(() => LostItemsViewModel(instance()));
  }
}

Future<void>initForgetPassword() async{
  if(!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.registerFactory<ForgetPasswordUseCase>(() =>
        ForgetPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(() =>ForgotPasswordViewModel(instance()));
  }
}
