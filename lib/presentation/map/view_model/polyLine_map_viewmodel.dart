import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/domain/models/models.dart';
import 'package:untitled/presentation/base/base_view_model.dart';

class PolyLineMapViewModel extends BaseViewModel with ChangeNotifier{
  @override
  void start() {
    // TODO: implement start
  }
  Set<Marker> _markers = {};
  Set<Marker> getMarkers(){
    return _markers;
  }

  markers(List<DataTransferPositions> position){
    position.map((e) => _markers.add(
        Marker(
          markerId: MarkerId( LatLng( double.parse(e.lat), double.parse(e.lng)).toString()),
          icon: BitmapDescriptor.defaultMarker ,
          position: LatLng( double.parse(e.lat), double.parse(e.lng)),
        )
    )).toSet();
    notifyListeners();

  }
}
