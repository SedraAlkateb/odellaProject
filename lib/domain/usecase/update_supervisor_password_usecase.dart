import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class UpdateSupervisorPasswordUseCase implements BaseUseCase<UpdatePasswordUseCaseInput,SuperVisor>{
  Repository _repository;
  UpdateSupervisorPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, SuperVisor>> execute(UpdatePasswordUseCaseInput input) {
    return _repository.updateSupervisorPassword(
        UpdatePasswordRequest(
          input.studentId,
          input.oldPassword,
          input.newPassword,
          input.newPassword_confirmation,
        ));
  }

}


class UpdatePasswordUseCaseInput {
  int studentId;
  String oldPassword;
  String newPassword;
  String newPassword_confirmation;
  UpdatePasswordUseCaseInput(
      this.studentId,
      this.oldPassword,
      this.newPassword,
      this.newPassword_confirmation
      );
}