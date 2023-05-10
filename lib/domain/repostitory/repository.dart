import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/data/responses/responses.dart';
import 'package:untitled/domain/models/models.dart';

abstract class Repository{
  Future<Either<Failure,PostModel>>posts();
  Future<  Either<Failure,Authentication>>login(LoginRequest loginRequest);
  Future<  Either<Failure,Universities>>getUniversities();
  Future< Either<Failure,TransferPositions>>getTransferPositions();
  Future< Either<Failure,TransportationLines>>getTransportationLines();
  Future< Either<Failure,Subscriptions>>getSubscriptions();
  Future< Either<Failure,Profile>>profile();
  Future< Either<Failure,PositionLine>>positionLine(int id);
  Future< Either<Failure,Areas>>getAreasByCityId(int id);
  Future< Either<Failure,Location>>getLocationById(int id);
  Future< Either<Failure,Cities>>getCities();

  Future< Either<Failure,Profile>>register(SignUpRequest signUpRequest);
  Future< Either<Failure,UpdateStudentModel>>updateStudent(UpdateStudentRequest updateStudentRequest);
  Future< Either<Failure,UpdateStudentModel>>updateStudentt(UpdateStudentRequest updateStudentRequest);
  Future< Either<Failure,UpdateStudentModel>>updatePassword(UpdatePasswordRequest updatePasswordRequest);
  Future< Either<Failure,UpdateStudentModel>>updateImage(UpdateImage updateImage);

  Future< Either<Failure,LogOutResponse>>logout();
  Future< Either<Failure,Program>>programs();
  Future< Either<Failure,Null>>confirmStudentAttendenceInTrip(ConfirmStudent confirmStudent);


}