
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class StoreClaimUseCase implements BaseUseCase<ClaimUseCaseInput,Null>{
  Repository _repository;
  StoreClaimUseCase(this._repository);

  @override
  Future<Either<Failure, Null>> execute(ClaimUseCaseInput input) {
    return _repository.storeClaim(
        ClaimRequest(
            input.trip_id,
              input.description,
        ));
  }

}


class ClaimUseCaseInput {
  int trip_id;
  String description;

  ClaimUseCaseInput(
      this.trip_id,
      this.description
      );
}