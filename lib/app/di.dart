
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/app/app_preferences.dart';
import 'package:untitled/data/data_source/remote_data_source.dart';
import 'package:untitled/data/network/app_api.dart';
import 'package:untitled/data/network/dio_factory.dart';
import 'package:untitled/data/network/network_info.dart';
import 'package:untitled/data/repository/repository.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/Universities_usecase.dart';
import 'package:untitled/domain/usecase/areas_usecase.dart';
import 'package:untitled/domain/usecase/cities_usecase.dart';
import 'package:untitled/domain/usecase/login_usecase.dart';
import 'package:untitled/domain/usecase/logout_usecase.dart';
import 'package:untitled/domain/usecase/position_line_usecase.dart';
import 'package:untitled/domain/usecase/posts_usecase.dart';
import 'package:untitled/domain/usecase/profile_usecase.dart';
import 'package:untitled/domain/usecase/programs_usecase.dart';
import 'package:untitled/domain/usecase/signup_usecase.dart';
import 'package:untitled/domain/usecase/student_attendence_usecase.dart';
import 'package:untitled/domain/usecase/subscriptions_usecase.dart';
import 'package:untitled/domain/usecase/transfer_positions_usecase.dart';
import 'package:untitled/domain/usecase/transportation_lines_usecase.dart';
import 'package:untitled/domain/usecase/tt.dart';
import 'package:untitled/domain/usecase/update_image_usecase.dart';
import 'package:untitled/domain/usecase/update_password_usecase.dart';
import 'package:untitled/domain/usecase/update_student_usecase.dart';
import 'package:untitled/presentation/base_home/view_model/base_home_view_model.dart';
import 'package:untitled/presentation/login/view_model/login_viewmodel.dart';
import 'package:untitled/presentation/map_position/view_model/map_position_view_model.dart';
import 'package:untitled/presentation/page/drawer/view/drawer_viewmodel.dart';
import 'package:untitled/presentation/page/home/view_model/home_view_model.dart';
import 'package:untitled/presentation/page/profile/view_model/profile_view_model.dart';
import 'package:untitled/presentation/page/program/view_model/programs_viewmodel.dart';
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
  instance.
  registerLazySingleton<AppPreferences>(() =>
      AppPreferences(instance()));
  //network info instance
  instance.registerLazySingleton<NetworkInfo>(() =>
      NetWorkInfoImpl(InternetConnectionChecker()));
  instance.registerLazySingleton<DioFactory>(() =>
      DioFactory(instance()));

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
    instance.registerFactory<LoginViewModel>(() =>LoginViewModel(instance()));

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
initBaseHomeModule() {
  if (!GetIt.I.isRegistered<TransportationLinesUseCase>()&&!GetIt.I.isRegistered<PositionLineUseCase>()) {
    instance.registerFactory<TransportationLinesUseCase>(() =>TransportationLinesUseCase(instance()));
    instance.registerFactory<PositionLineUseCase>(() =>PositionLineUseCase(instance()));
    instance.registerFactory<BaseHomeViewModel>(() => BaseHomeViewModel(instance(),instance()));
  }
}
initProfileModule() {
  if (!GetIt.I.isRegistered<ProfileUseCase>()) {
    instance.registerFactory<ProfileUseCase>(() =>ProfileUseCase(instance()));
    instance.registerFactory<UpdateStudentUseCase>(() =>UpdateStudentUseCase(instance()));
    instance.registerFactory<UpdateStudenttUseCase>(() =>UpdateStudenttUseCase(instance()));
    instance.registerFactory<UpdatePasswordUseCase>(() =>UpdatePasswordUseCase(instance()));
    instance.registerFactory<UpdateImageUseCase>(() =>UpdateImageUseCase(instance()));
    instance.registerFactory<ProfileViewModel>(() => ProfileViewModel(instance(),instance(),instance(),instance(),instance()));
  }
}
initLogoutModule() {
  if (!GetIt.I.isRegistered<LogoutUseCase>()) {
    instance.registerFactory<LogoutUseCase>(() =>LogoutUseCase(instance()));
    instance.registerFactory<DrawerViewModel>(() => DrawerViewModel(instance()));
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