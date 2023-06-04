
import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class ResetPasswordUseCase implements BaseUseCase<RestPasswordUseCaseInput,String>{
  Repository _repository;
  ResetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(RestPasswordUseCaseInput input) {
    return _repository.resetPassword(
        RestPasswordRequest(
            input.email,
            input.code,
            input.newPassword
        )
    );
  }

}
class RestPasswordUseCaseInput{
  String email;
  int code;
  String newPassword;

  RestPasswordUseCaseInput(this.email, this.code, this.newPassword);
}

