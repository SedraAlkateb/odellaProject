
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
import 'package:untitled/presentation/resources/font_manager.dart';
import 'package:untitled/presentation/resources/style_manage.dart';
import 'package:untitled/presentation/resources/values_manager.dart';
//presentation
ThemeData getApplicationTheme(){
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,
   // primaryColorDark: ColorManager.primary,
   // primaryColorLight: ColorManager.primary,
  //  disabledColor: ColorManager.black,
  //  splashColor:  ColorManager.primary,//ripple effect color
    //card view theme

    cardTheme: CardTheme(
    //  color: ColorManager.card,
      shadowColor:ColorManager.shadowCard,
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s18),

      ),
    ),

    //app bar them

    appBarTheme: AppBarTheme(
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(color: ColorManager.icon,size:AppSize.s30)  ,
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      // elevation:AppSize.s4 ,
      titleTextStyle: getRegularStyle(fontSize: FontSize.s16 , color:ColorManager.white ),

    ),


    //button them

    buttonTheme: ButtonThemeData(
      shape:const StadiumBorder(),//button ns da2ra
        disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.button,
      splashColor: ColorManager.shadow,
    ) ,

    ///elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(

        textStyle: getMediumStyle(
            color: ColorManager.white,fontSize: FontSize.s20
        ),

        shadowColor: ColorManager.shadow1,
    //    elevation: AppSize.s16,
        primary: ColorManager.button,


        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s30),

        ),


      ),
    ),

    //text theme


textTheme: TextTheme(
  displayLarge: getSemiBoldStyle(color: ColorManager.darkGray,fontSize: FontSize.s16),
    headlineLarge: getSemiBoldStyle(
        color: ColorManager.darkGray,fontSize: FontSize.s16),
  headlineMedium: getRegularStyle(
      color: ColorManager.darkGray,fontSize: FontSize.s14),
  titleMedium: getMediumStyle(color: ColorManager.sidBarIcon,fontSize: FontSize.s16),
    bodySmall : getRegularStyle(color:Colors.black87,fontSize: FontSize.s14),
  bodyLarge : getRegularStyle(color: Colors.black54,fontSize: FontSize.s16),
  titleLarge: getBoldStyle(color: ColorManager.sidBarIcon,fontSize: FontSize.s16),
  labelLarge: getBoldStyle(color: ColorManager.sidBarIcon,fontSize: FontSize.s20),

),

    //input decoration theme

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p12),
      hintStyle: getRegularStyle(color: ColorManager.hintGrey,fontSize: FontSize.s12),
        labelStyle: getMediumStyle(color: ColorManager.labelGrey,fontSize: FontSize.s20),
     // : ColorManager.black,
      errorStyle: getRegularStyle(color: ColorManager.error),

      /////enabled Border style

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s1_5),
        borderRadius:const BorderRadius.all(Radius.circular(AppSize.s16),),

      ),

      ///focused Border style
      focusedBorder:  OutlineInputBorder(

  borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5,),
  borderRadius:const BorderRadius.all(Radius.circular(AppSize.s16),),
      ),

      //error border style

      errorBorder:  OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.error,width: AppSize.s1_5),
  borderRadius:const BorderRadius.all(Radius.circular(AppSize.s16),),
      ),
      focusedErrorBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary ,width: AppSize.s1_5),
        borderRadius:const BorderRadius.all(Radius.circular(AppSize.s16),),
      ),
  ),

  );
}
