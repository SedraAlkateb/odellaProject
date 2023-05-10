import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class UpdateStudenttUseCase implements BaseUseCase<UpdateStudenttUseCaseInput,UpdateStudentModel>{
  Repository _repository;
  UpdateStudenttUseCase(this._repository);

  @override
  Future<Either<Failure, UpdateStudentModel>> execute(UpdateStudenttUseCaseInput input) {
    return _repository.updateStudentt(
        UpdateStudentRequest(
          input.studentId,
          city_id:    input.city_id,
          area_id: input.area_id,
          street:   input.street,
          subscription_id:   input.subscription_id,
          firstName:   input.firstName,
          lastName:   input.lastName,
          phoneNumber:  input.phoneNumber,
          transportation_line_id:  input.transportation_line_id,
          transfer_position_id: input.transfer_position_id,
          university_id: input.university_id,
        ));
  }

}


class UpdateStudenttUseCaseInput {
  int studentId;
  int? city_id;
  int? area_id;
  String? street;
  String? subscription_id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? transportation_line_id;
  String? transfer_position_id;
  String? university_id ;

  UpdateStudenttUseCaseInput(
      this.studentId,
      {
        this.city_id,
        this.area_id,
        this.street,
        this.subscription_id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.transportation_line_id,
        this.transfer_position_id,
        this.university_id
      });
}