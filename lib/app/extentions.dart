import 'package:sizer/sizer.dart';
import 'package:untitled/app/constants.dart';
extension NonNullString on String?{
  String orEmpty(){
    if(this==null){
      return Constants.empty;
    }else{
      return this!;
    }
  }
}
extension NonNullInt on int?{
  int orZero(){
    if(this==null){
      return Constants.zero;
    }else{
      return this!;
    }
  }
}
extension SizerExt on num
{
  double get h =>
      this * SizerUtil.height / 100;
  double get w =>
      this * SizerUtil.width / 100;
  double get sp=> this *((SizerUtil.width)/3)/100;
}
