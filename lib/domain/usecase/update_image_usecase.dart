import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class UpdateImageUseCase implements BaseUseCase<UpdateImageUseCaseInput,UpdateStudentModel>{
  Repository _repository;
  UpdateImageUseCase(this._repository);

  @override
  Future<Either<Failure, UpdateStudentModel>> execute(UpdateImageUseCaseInput input) {
    return _repository.updateImage(
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