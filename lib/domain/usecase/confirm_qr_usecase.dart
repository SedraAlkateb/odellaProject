
import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class ConfirmQrUseCase implements BaseUseCase<ConfirmQrUseCaseInput,String>{
  Repository _repository;
  ConfirmQrUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(ConfirmQrUseCaseInput input) {
    return _repository.confirmStudentByQrCode(ConfirmQrRequest(input.userId, input.tripId));
  }

}


class ConfirmQrUseCaseInput{
  int userId;
  int tripId;
  ConfirmQrUseCaseInput(this.userId,this.tripId);
}