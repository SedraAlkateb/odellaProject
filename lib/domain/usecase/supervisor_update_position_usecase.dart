
import 'package:dartz/dartz.dart';
import 'package:untitled/data/network/failure.dart';
import 'package:untitled/data/network/requests/requsets.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/domain/repostitory/repository.dart';
import 'package:untitled/domain/usecase/base_usecase.dart';

class SupervisorUpdatePositionUseCase implements BaseUseCase<UpdatePositionSupervisorUseCaseInput,String>{
  Repository _repository;

  SupervisorUpdatePositionUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(UpdatePositionSupervisorUseCaseInput input) async{
    return await _repository.supervisorPositionUpdate(PositionMap(input.tripId, input.lng, input.lat));

  }


}
class UpdatePositionSupervisorUseCaseInput {
  int tripId;
  double lng;
  double lat;

  UpdatePositionSupervisorUseCaseInput(this.tripId, this.lng, this.lat);
}