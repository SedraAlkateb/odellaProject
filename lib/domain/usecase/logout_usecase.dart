import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/responses/responses.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class LogoutUseCase extends BaseUseCase<Null,LogOutResponse> {
  Repository _repository;

  LogoutUseCase(this._repository);

  @override
  Future<Either<Failure, LogOutResponse>> execute(Null input)async {
   return await _repository.logout();
  }

}