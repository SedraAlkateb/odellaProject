import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class UpdateSupervisorImageUseCase implements BaseUseCase<UpdateImageUseCaseInput,SuperVisor>{
  Repository _repository;
  UpdateSupervisorImageUseCase(this._repository);

  @override
  Future<Either<Failure, SuperVisor>> execute(UpdateImageUseCaseInput input) {
    return _repository.updateSupervisorImage(
        UpdateImage(
            input.studentId,
            input.image
        ));
  }

}


class UpdateImageUseCaseInput {
  int studentId;
  File image;

  UpdateImageUseCaseInput(
      this.studentId,
      this.image
      );
}