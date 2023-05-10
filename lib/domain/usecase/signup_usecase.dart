import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class SignUpUseCase implements BaseUseCase<SignUpCaseInput,Profile>{
  Repository _repository;
  SignUpUseCase(this._repository);

  @override
  Future<Either<Failure, Profile>> execute(SignUpCaseInput input) {
  return _repository.register(SignUpRequest(input.city_id,
      input.area_id,
      input.street,
      input.subscription_id,
      input.firstName, input.lastName, input.email,
      input.password, input.phoneNumber, input.transportation_line_id,
      input.transfer_position_id,  input.university_id,image: input.image));
  }


}


class SignUpCaseInput{
  int city_id;
  int area_id;
  String street;
  int subscription_id;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  int transportation_line_id;
  int transfer_position_id;
  File? image;
  int university_id ;

  SignUpCaseInput(
      this.city_id,
      this.area_id,
      this.street,
      this.subscription_id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phoneNumber,
      this.transportation_line_id,
      this.transfer_position_id,
      this.image,
      this.university_id);
}