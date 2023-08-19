import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/responses/responses.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class PhoneUseCase extends BaseUseCase<int,BasePhone> {
  Repository _repository;

  PhoneUseCase(this._repository);

  @override
  Future<Either<Failure, BasePhone>> execute(int input)async {
    return await _repository.phone(input);
  }

}