import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/responses/responses.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class ReadAllNotificationUseCase extends BaseUseCase<Null,String> {
  Repository _repository;

  ReadAllNotificationUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(Null input)async {
    return await _repository.readAllNot();
  }

}