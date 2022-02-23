import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/widgets/divider.dart';

drawer({required BuildContext context,
  required Function() onTap
}){
  return Drawer(
    child: Drawer(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.h,
            decoration: BoxDecoration(
              gradient:const LinearGradient(
                  colors: [Colors.lightGreen,Colors.lightGreenAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.sp),
                bottomRight: Radius.circular(30.sp),
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                divider(),
                SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child:const CircleAvatar(
                    backgroundImage: AssetImage("assets/profile.jpg"),
                  ),
                ),

               const Text("Name",style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.w500,
                ),),
               const Text("ID: 410",style: TextStyle(
                  fontSize: 15,fontWeight: FontWeight.w400,
                ),),
              ],
            ),
          ),
          divider(),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                divider(width: 20.w,height: 10.h),
                FaIcon(FontAwesomeIcons.signOutAlt,
                  color: Colors.grey,size: 22.sp,
                ),
                divider(width: 20.w,height: 10.h),
               const Text("Log out",style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey
                ),),
              ],
            ),
          )
        ],
      ),
    ),
  );
}