import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class ReadNotificationByIdUseCase extends BaseUseCase<int,String> {
  Repository _repository;
  ReadNotificationByIdUseCase(this._repository);
  @override
  Future<Either<Failure, String>> execute(int input)async {
    return await _repository.makeReadNotification(input);
  }

}