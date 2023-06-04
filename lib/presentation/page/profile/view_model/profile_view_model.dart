import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/app/constants.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/usecase/profile_usecase.dart';
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

  final UpdateStudentUseCase _updateStudentUseCase;
  final UpdateStudenttUseCase _studenttUseCase;
  final UpdatePasswordUseCase _updatePasswordUseCase;

  ProfileViewModel(this._profileUseCase,this._updateStudentUseCase,this._studenttUseCase,this._updatePasswordUseCase,this._updateImageUseCase);
  Profile? _profile;
  var studentUpdate=UpdateStudentObject(0,area_id: 1,street: "asddassad",city_id:2 );
  File? imm;
  Color color1=ColorManager.darkGray;
  Color color2=ColorManager.darkGray;
  Color color3=ColorManager.darkGray;
  Color color4=ColorManager.darkGray;
  bool _isStudent=false;
  setIsStudent(bool st){
    _isStudent=st;
    notifyListeners();
  }
 bool getIsStudent(){
    return _isStudent;
  }
  File? getIm(){
    return imm ;
  }
  setIm(File file){
     imm=file;
     notifyListeners();
  }


  @override
  void start() {
   student();
  }

  @override
  void dispose() {
    super.dispose();
  }

 int? getId(){
    return _profile?.userModel?.id;
  }
  ///////////////////color
 Color getColor1(){
    return color1;
  }
  Color getColor2(){
    return color2;
  }
  Color getColor3(){
    return color3;
  }
  Color getColor4(){
    return color4;
  }
  setColor1(){
    color1=ColorManager.card;

    notifyListeners();
  }
  setColor2(){
    color2=ColorManager.card;
    notifyListeners();
  }
  setColor3(){
    color3=ColorManager.card;
    notifyListeners();
  }
  setColor4(){
    color4=ColorManager.card;

    notifyListeners();
  }
  ///////////////////////////
  String getSubscriptionsId(){
    if(studentUpdate.subscription_id!=null){
      return studentUpdate.subscription_id.toString();
    }else{
      return _profile?.userModel?.subscription_id ??"";
    }
  }
  String getFirstName(){
    if(studentUpdate.firstName!=null){
      return studentUpdate.firstName.toString();
    }else{
      return _profile?.userModel?.firstName ??"";
    }
  }
  String getLastName(){
    if(studentUpdate.lastName!=null){
      return studentUpdate.lastName.toString();
    }else{
      return _profile?.userModel?.lastName ??"";
    }
  }
  String getEmail(){
    if(studentUpdate.email!=null){
      return studentUpdate.email.toString();
    }else{
      return _profile?.userModel?.email ??"";
    }
  }
  String getPhone(){
    if(studentUpdate.phoneNumber!=null){
      return studentUpdate.phoneNumber.toString();
    }else{
      return _profile?.userModel?.phoneNumber ??"";
    }
  }
  String getTransportationLineId(){
    if(studentUpdate.transportation_line_id!=null){
      return studentUpdate.transportation_line_id.toString();
    }else{
      return _profile?.userModel?.transportation_line_id ??"";
    }
  }
  String getTransferPositionId(){
    if(studentUpdate.transfer_position_id!=null){
      return studentUpdate.transfer_position_id.toString();
    }else{
      return _profile?.userModel?.transfer_position_id ??"";
    }
  }
  String getUniversityId(){
    if(studentUpdate.university_id!=null){
      return studentUpdate.university_id.toString();
    }else{
      return _profile?.userModel?.university_id ??"";
    }
  }

  ////////////////////////////////////////////////////UpdateProfile
  setIdStudent(int id){
    studentUpdate=studentUpdate.copyWith(studentId: id);
    _profile?.userModel?.id=id;
  }
  updateCityId(int string){
    studentUpdate=studentUpdate.copyWith(city_id: string);
  }
  updateAreaId(int string){
    studentUpdate=studentUpdate.copyWith(area_id: string);
  }
  updateSubscriptionsId(int string){
    studentUpdate=studentUpdate.copyWith(subscription_id: string);
    _profile?.userModel?.subscription_id=string as String;
notifyListeners();
  }
  updateStreetId(String string){
    studentUpdate=studentUpdate.copyWith(street: string);
  }
  updateFirstName(String string){
    studentUpdate=studentUpdate.copyWith(firstName: string);
  //  setFirstName(string);
    _profile!.userModel!.firstName=studentUpdate.firstName!;
    notifyListeners();
  }
  updateLastName(String string){
    studentUpdate=studentUpdate.copyWith(lastName: string);
    _profile!.userModel!.lastName=studentUpdate.lastName!;
    notifyListeners();
  }
  updateEmail(String string){
    studentUpdate=studentUpdate.copyWith(email: string);
    _profile!.userModel!.email=studentUpdate.email!;
    notifyListeners();
  }
  updatePhone(String string){
    studentUpdate=studentUpdate.copyWith(phoneNumber: string);
    _profile!.userModel!.phoneNumber=studentUpdate.phoneNumber!;
    notifyListeners();
  }
  setNewPassword(String string){
    studentUpdate=studentUpdate.copyWith(newPassword: string);
  }
  setOldPassword(String string){
    studentUpdate=studentUpdate.copyWith(oldPassword: string);
  }
  setNewPasswordConfirmation(String string){
    studentUpdate=studentUpdate.copyWith(newPassword_confirmation: string);
  }
  updateTransportationLineId(int string){
    studentUpdate=studentUpdate.copyWith(transportation_line_id: string);
    _profile?.userModel?.transportation_line_id=string as String ;
    notifyListeners();
  }
  updateTransferPositionId(int string){
    studentUpdate=studentUpdate.copyWith(transfer_position_id: string);
    _profile?.userModel?.transfer_position_id=string as String;
    notifyListeners();
  }
  updateUniversityId(int string){
    studentUpdate=studentUpdate.copyWith(university_id: string);
    _profile?.userModel?.university_id=string as String;
notifyListeners();
  }
  updateImageFromGallory()async{
    studentUpdate= studentUpdate.copyWith(image: await pickImage());
    setIm(studentUpdate.image!);

    notifyListeners();
  }


  //  File? image
  ////////////////////////////////////////////////////Profile
  File? getImage(){
    return studentUpdate.image;
  }
  String?  getName(){
    return "${getFirstName()} ${getLastName()}";
  }

    setFirstName(String firstName){
    _profile?.userModel?.firstName
    =firstName;
    notifyListeners();
  }
    setEmail(String email){
     _profile?.userModel?.email=email;
     notifyListeners();
  }
    setPhone(String phone){
    _profile?.userModel?.phoneNumber=phone;
    notifyListeners();
  }
    setLastName(String lastName){
    _profile?.userModel?.lastName=lastName;
    notifyListeners();
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  setProfile(Profile profile){
    _profile=profile;
    notifyListeners();
  }

//////////////////////////////////////
  student() async {
    inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _profileUseCase.execute(null))
        .fold((failure) {
      inputState.add(ErrorState(StateRendererType.popupErrorState, failure.massage));
    }, (data)async {
          setProfile(data);
          setIsStudent(true);
          if(data.userModel?.image!=null&& data.userModel?.image!=""){
            final file= await  ImageDownloader.downloadImage(data.userModel?.image ??"");
            setIm(file);
          }

         inputState.add(ContentState());
      notifyListeners();
    });
  }
  //////////////////////////////
  UpdateStudent() async {
  //  inputState.add(
  //      LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _studenttUseCase.execute(UpdateStudenttUseCaseInput(
      getId()?? 0,
      area_id: studentUpdate.area_id,
      city_id: studentUpdate.city_id,
      firstName: getFirstName(),
      lastName: getLastName(),
 //     newPassword: studentUpdate.newPassword,
  //    newPassword_confirmation: studentUpdate.newPassword_confirmation,
   //   oldPassword: studentUpdate.oldPassword,
      phoneNumber: getPhone(),
      street: studentUpdate.street,
      subscription_id: getSubscriptionsId(),
      transfer_position_id: getTransferPositionId(),
      transportation_line_id: getTransportationLineId(),
      university_id: getUniversityId()
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

  updatePassword() async {
    //  inputState.add(
    //      LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _updatePasswordUseCase.execute(UpdatePasswordUseCaseInput(
        getId()?? 0,
        studentUpdate.oldPassword ??"",
         studentUpdate.newPassword??"",
        studentUpdate.newPassword_confirmation??"" ,
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
      getId()?? 0,
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
  UpdateStudent1() async {
    //  inputState.add(
    //      LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _updateStudentUseCase.execute(UpdateStudentUseCaseInput(
        getId()?? 0,
        area_id: studentUpdate.area_id,
        city_id: studentUpdate.city_id,
        firstName: studentUpdate.firstName,
        lastName: studentUpdate.lastName,
       phoneNumber: studentUpdate.phoneNumber,
        street: studentUpdate.street,
        subscription_id: studentUpdate.subscription_id.toString(),
        transfer_position_id: studentUpdate.transfer_position_id.toString(),
        transportation_line_id: studentUpdate.transportation_line_id.toString(),
        university_id: studentUpdate.university_id.toString(),
      image: studentUpdate.image
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

}
