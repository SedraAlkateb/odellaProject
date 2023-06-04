
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class StoreLostUseCase implements BaseUseCase<LostUseCaseInput,Null>{
  Repository _repository;
  StoreLostUseCase(this._repository);

  @override
  Future<Either<Failure, Null>> execute(LostUseCaseInput input) {
    return _repository.storeLostFound(
        DescriptionRequest(
            input.trip_id,
            input.description,
            image: input.image
        ));
  }

}


class LostUseCaseInput {
  int trip_id;
  String description;
  File? image;

  LostUseCaseInput(
      this.trip_id, this.description,{
        this.image
      });
}