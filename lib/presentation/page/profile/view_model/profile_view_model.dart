import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/app/constants.dart';
import 'package:untitled/data/network/error_handler.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/Universities_usecase.dart';
import 'package:untitled/domain/usecase/areas_usecase.dart';
import 'package:untitled/domain/usecase/cities_usecase.dart';
import 'package:untitled/domain/usecase/profile_usecase.dart';
import 'package:untitled/domain/usecase/subscriptions_usecase.dart';
import 'package:untitled/domain/usecase/tt.dart';
import 'package:untitled/domain/usecase/update_image_usecase.dart';
import 'package:untitled/domain/usecase/update_password_usecase.dart';
import 'package:untitled/domain/usecase/update_student_usecase.dart';
import 'package:untitled/presentation/base/base_view_model.dart';
import 'package:untitled/presentation/common/freezed_data.dart';
import 'package:untitled/presentation/common/image/image.dart';
import 'package:untitled/presentation/common/image/downloadImage.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer.dart';
import 'package:untitled/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:untitled/presentation/resources/color_manager.dart';

class ProfileViewModel extends BaseViewModel with ChangeNotifier {
  final ProfileUseCase _profileUseCase;
  final UpdateImageUseCase _updateImageUseCase;
  //TODO
  final UpdateStudentUseCase _updateStudentUseCase;
  final UpdateStudenttUseCase _studenttUseCase;
  final UpdatePasswordUseCase _updatePasswordUseCase;
  final CitiesUseCase _citiesUseCase;
  final AreasUseCase _areasUseCase;
  final SubscriptionsUseCase _subscriptionsUseCase;
  final UniversitiesUsecase _universitiesUsecase;
  ProfileViewModel(
      this._profileUseCase,
      this._updateStudentUseCase,
      this._studenttUseCase,
      this._updatePasswordUseCase,
      this._updateImageUseCase,
      this._citiesUseCase,
      this._areasUseCase,
      this._subscriptionsUseCase,
      this._universitiesUsecase);
  UserProfile? _profile;
  var studentUpdate =
      UpdateStudentObject(0, area_id: 1, street: "asddassad", city_id: 2);
  File? imm;
  Color color1 = ColorManager.darkGray;
  Color color2 = ColorManager.darkGray;
  Color color3 = ColorManager.darkGray;
  Color color4 = ColorManager.darkGray;
  bool _isStudent = false;
  List<City> _cities = [];
  List<Area> _areas = [];
  List<DataSubscriptions> _dataSubscriptions = [];
  List<DataModel> _dataModel = [];
  setIsStudent(bool st) {
    _isStudent = st;
    notifyListeners();
  }

  bool getIsStudent() {
    return _isStudent;
  }

  File? getIm() {
    return imm;
  }

  setIm(File file) {
    imm = file;
    notifyListeners();
  }
DataSubscriptions? getStudentSub(){
    return _profile?.subscription;
}
  @override
  void start() {
    student()
        .then((value) => getAreasByIdCity(_profile?.location?.city?.id ?? 0));
    getUniversitiesData();
    getSubscriptionsData();
    getCitiesData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int? getId() {
    print(_profile?.id);
    return _profile?.id;
  }

  ///////////////////color
  Color getColor1() {
    return color1;
  }

  Color getColor2() {
    return color2;
  }

  Color getColor3() {
    return color3;
  }

  Color getColor4() {
    return color4;
  }

  setColor1() {
    color1 = ColorManager.card;

    notifyListeners();
  }

  setColor2() {
    color2 = ColorManager.card;
    notifyListeners();
  }

  setColor3() {
    color3 = ColorManager.card;
    notifyListeners();
  }

  setColor4() {
    color4 = ColorManager.card;

    notifyListeners();
  }

  ///////////////////////////
  String getSubscriptionsId() {
    if (studentUpdate.subscription_id != null) {
      return studentUpdate.subscription_id.toString();
    } else {
      return _profile?.subscription?.id.toString() ?? "";
    }
  }

  String getFirstName() {
    if (studentUpdate.firstName != null) {
      return studentUpdate.firstName.toString();
    } else {
      return _profile?.firstName ?? "";
    }
  }

  String getLastName() {
    if (studentUpdate.lastName != null) {
      return studentUpdate.lastName.toString();
    } else {
      return _profile?.lastName ?? "";
    }
  }

  String getEmail() {
    if (studentUpdate.email != null) {
      return studentUpdate.email.toString();
    } else {
      return _profile?.email ?? "";
    }
  }

  String getPhone() {
    if (studentUpdate.phoneNumber != null) {
      return studentUpdate.phoneNumber.toString();
    } else {
      return _profile?.phoneNumber ?? "";
    }
  }

  String getStreet() {
    if (studentUpdate.street != null) {
      return studentUpdate.street.toString();
    } else {
      return _profile?.location?.street ?? "";
    }
  }

  String getTransportationLineId() {
    if (studentUpdate.transportation_line_id != null) {
      return studentUpdate.transportation_line_id.toString();
    } else {
      return _profile?.line?.id.toString() ?? "";
    }
  }

  String getTransferPositionId() {
    if (studentUpdate.transfer_position_id != null) {
      return studentUpdate.transfer_position_id.toString();
    } else {
      return _profile?.position?.id.toString() ?? "";
    }
  }

  String? getUniversityId() {
    if (studentUpdate.university_id != null) {
      return studentUpdate.university_id.toString();
    } else {
      return _profile?.university?.id.toString();
    }
  }

  ////////////////////////////////////////////////////UpdateProfile
  setIdStudent(int id) {
    studentUpdate = studentUpdate.copyWith(studentId: id);
    _profile?.id = id;
  }

  updateCityId(int string) {
    studentUpdate = studentUpdate.copyWith(city_id: string);
  }

  updateAreaId(int string) {
    studentUpdate = studentUpdate.copyWith(area_id: string);
  }

  updateSubscriptionsId(int string) {
    studentUpdate = studentUpdate.copyWith(subscription_id: string);
    _profile?.subscription?.id = string;
    notifyListeners();
  }

  updateStreet(String string) {
    studentUpdate = studentUpdate.copyWith(street: string);
  }

  updateFirstName(String string) {
    studentUpdate = studentUpdate.copyWith(firstName: string);
    //  setFirstName(string);
    _profile!.firstName = studentUpdate.firstName!;
    notifyListeners();
  }

  updateLastName(String string) {
    studentUpdate = studentUpdate.copyWith(lastName: string);
    _profile!.lastName = studentUpdate.lastName!;
    notifyListeners();
  }

  updateEmail(String string) {
    studentUpdate = studentUpdate.copyWith(email: string);
    _profile!.email = studentUpdate.email!;
    notifyListeners();
  }

  updatePhone(String string) {
    studentUpdate = studentUpdate.copyWith(phoneNumber: string);
    _profile!.phoneNumber = studentUpdate.phoneNumber!;
    notifyListeners();
  }

  setNewPassword(String string) {
    studentUpdate = studentUpdate.copyWith(newPassword: string);
  }

  setOldPassword(String string) {
    studentUpdate = studentUpdate.copyWith(oldPassword: string);
  }

  setNewPasswordConfirmation(String string) {
    studentUpdate = studentUpdate.copyWith(newPassword_confirmation: string);
  }

  updateTransportationLineId(int string) {
    studentUpdate = studentUpdate.copyWith(transportation_line_id: string);
    _profile?.line?.id = string;
    notifyListeners();
  }

  updateTransferPositionId(int string) {
    studentUpdate = studentUpdate.copyWith(transfer_position_id: string);
    _profile?.position?.id = string;
    notifyListeners();
  }

/*
  updateUniversity(int string){
    studentUpdate=studentUpdate.copyWith(university_id: string);
    _profile?.university =string ;
notifyListeners();
  }
 */
  updateImageFromGallory() async {
    studentUpdate = studentUpdate.copyWith(image: await pickImage());
    setIm(studentUpdate.image!);

    notifyListeners();
  }

  //  File? image
  ////////////////////////////////////////////////////Profile
  File? getImage() {
    return studentUpdate.image;
  }

  String? getName() {
    return "${getFirstName()} ${getLastName()}";
  }

  setFirstName(String firstName) {
    _profile?.firstName = firstName;
    notifyListeners();
  }

  setEmail(String email) {
    _profile?.email = email;
    notifyListeners();
  }

  setPhone(String phone) {
    _profile?.phoneNumber = phone;
    notifyListeners();
  }

  setLastName(String lastName) {
    _profile?.lastName = lastName;
    notifyListeners();
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  setProfile(UserProfile profile) {
    _profile = profile;
    notifyListeners();
  }

//////////////////////////////////////
  student() async {
   setStateScreen(1);
    (await _profileUseCase.execute(null)).fold((failure) {
      print(failure.massage);
      if(failure.code==ResponseCode.UNAUTORISED)
      {
        setStateScreen(4);
      }
      else{
        setStateScreen(2);

      }
    }, (data) async {
      setStateScreen(0);
      setProfile(data);
      setIsStudent(true);
      if (data.image != null && data.image != "" && data.image != " ") {
        final file = await ImageDownloader.downloadImage(data.image!);
        setIm(file);
      }
      notifyListeners();
    });
  }
String message="";
  setMessage(String m){
    message=m;
    notifyListeners();
  }
 String getMessage(){
    return message;
  }
  bool update=false;
  //////////////////////////////
 Future<bool> UpdateStudent() async {
    (await _studenttUseCase.execute(UpdateStudenttUseCaseInput(getId() ?? 0,
            area_id: getArea(),
            city_id: getCity(),
            firstName: getFirstName(),
            lastName: getLastName(),
            phoneNumber: getPhone(),
            street: studentUpdate.street,
            subscription_id: getSubscriptionsId(),
            transfer_position_id: getTransferPositionId(),
            transportation_line_id: getTransportationLineId(),
            university_id: getUniversityId())))
        .fold((failure) {
          setMessage(failure.massage);
          update=false;
      // inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data) {
          update=true;
      // setProfile(data);
      //   inputState.add(ContentState());
      setMessage("Succsec");
      print("object");
      notifyListeners();
    });
    return update;
  }

  updatePassword() async {
    //  inputState.add(
    //      LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _updatePasswordUseCase.execute(UpdatePasswordUseCaseInput(
      getId() ?? 0,
      studentUpdate.oldPassword ?? "",
      studentUpdate.newPassword ?? "",
      studentUpdate.newPassword_confirmation ?? "",
    )))
        .fold((failure) {
      // inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data) {
      // setProfile(data);
      //   inputState.add(ContentState());
      print("object");
      notifyListeners();
    });
  }

  updateImage() async {
    //  inputState.add(
    //      LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _updateImageUseCase.execute(UpdateImageUseCaseInput(
      getId() ?? 0,
      studentUpdate.image ?? File(""),
    )))
        .fold((failure) {
      // inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data) {
      // setProfile(data);
      //   inputState.add(ContentState());
      print("object");
      notifyListeners();
    });
  }

  setUniversities(List<DataModel> universities) {
    _dataModel = universities;
  }

  setCities(List<City> cities) {
    _cities = cities;
  }

  setDataSubscriptions(List<DataSubscriptions> subscription) {
    _dataSubscriptions = subscription;
  }

  setAreas(List<Area> ListAreas) {
    _areas = ListAreas;
  }

  List<City> getCities() {
    return _cities;
  }

  List<Area> getAreas() {
    return _areas;
  }

  List<DataModel> getUniversities() {
    return _dataModel;
  }

  List<DataSubscriptions> getDataSubscriptions() {
    return _dataSubscriptions;
  }

  setUniversityId(int universityId) {
    studentUpdate = studentUpdate.copyWith(university_id: universityId);
  }

  setCityId(int cityId) {
    studentUpdate = studentUpdate.copyWith(city_id: cityId);
  }

  getUniversitiesData() async {
    (await _universitiesUsecase.execute(null)).fold((failure) {
      //  inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.massage));
    }, (data) {
      setUniversities(data.dataModel);
    });
  }

  getSubscriptionsData() async {
    (await _subscriptionsUseCase.execute(null)).fold((failure) {
      //     inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.massage));
    }, (data) {
      setDataSubscriptions(data.dataSubscriptions);
    });
  }

  getCitiesData() async {
    (await _citiesUseCase.execute(null)).fold((failure) {
      //    inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.massage));
    }, (data) {
      setCities(data.cities!);
    });
  }

  String getProfileCity() {
    return _profile?.location?.city?.name ?? " Cities";
  }

  String getProfileArea() {
    return _profile?.location?.area?.name ?? " Areas";
  }

  String getProfileUni() {
    return _profile?.university?.name ?? " Universities";
  }

  int getCity() {
    if (studentUpdate.city_id != null) {
      return studentUpdate.city_id ?? 0;
    } else {
      return _profile?.location?.city?.id ?? 0;
    }
  }

  int getArea() {
    if (studentUpdate.area_id != null) {
      return studentUpdate.area_id ?? 0;
    } else {
      return _profile?.location?.area?.id ?? 0;
    }
  }

  getAreasByIdCity(int id) async {
    (await _areasUseCase.execute(id)).fold((failure) {}, (data) {
      setAreas(data.areas!);
      notifyListeners();
    });
  }

  setAreaId(int areaId) {
    studentUpdate = studentUpdate.copyWith(area_id: areaId);
  }
  @override
  setStateScreen(int state) {
    notifyListeners();
    return super.setStateScreen(state);
  }
  @override
  setDialog(int state) {
    notifyListeners();
    return super.setDialog(state);
  }
}
