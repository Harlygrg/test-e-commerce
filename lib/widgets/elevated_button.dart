import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

divider({double width =20,double height=20}){
  return SizedBox(width: width,height: height,);
}


Widget  elevatedButton({
  required BuildContext context,
  required Function() onpressed,
  required String buttonName,
  bool googleIcon=true,
  Color color =const Color(0xff1a53ff),
}){
  return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        primary: color,
          shape:StadiumBorder()
          //RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.sp))
      ),
      child:Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 180.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              googleIcon?
              SizedBox(width: 40.w,height: 40.h,
              child:const CircleAvatar(
                backgroundImage: AssetImage("assets/google.jpg"),
              ),)
                  :FaIcon(FontAwesomeIcons.phoneAlt,color: Colors.white,size: 20.sp,),
              divider(width: 80.w),
              Text(buttonName,style: TextStyle(fontSize: 18.sp),),
            ],
          ),
        ),
      ));
}