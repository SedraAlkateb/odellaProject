import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class UpdateSupervisorUseCase implements BaseUseCase<UpdateSupervisorUseCaseInput,SuperVisor>{
  Repository _repository;
  UpdateSupervisorUseCase(this._repository);

  @override
  Future<Either<Failure, SuperVisor>> execute(UpdateSupervisorUseCaseInput input) {
    return _repository.updateSupervisor(
        UpdataSupervisorRequest(
          input.studentId,
          firstName:   input.firstName,
          lastName:   input.lastName,
          phoneNumber:  input.phoneNumber,
          cityId: input.cityId,
          areaId:input.areaId,
            street: input.street
           ));
  }

}


class UpdateSupervisorUseCaseInput {
  int studentId;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? cityId;
  int? areaId;
  String? street;

  UpdateSupervisorUseCaseInput(
      this.studentId,
      {
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.cityId,
        this.areaId,
        this.street
      });
}