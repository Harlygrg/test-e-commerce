import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_app/controller/sign_in_controller.dart';
import 'package:test_app/widgets/elevated_button.dart';

class LoginScreen extends StatelessWidget {
 final controller= Get.put(SignInController());
   LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
             children: [
               divider(height: 200.h),
               Center(
                 child: SizedBox(
                   width: 300.w,
                   height: 300.h,
                   child: Image.asset("assets/firebaseLogo.png"),
                 ),
               ),
               divider(height: 20.h),
               SizedBox(
                 width: 320.w,
                 height: 65.h,
                 child:elevatedButton(context: context,
                     onpressed: (){
                   controller.login();
                     },
                     buttonName: "Google") ,
               ),
               divider(height: 10.h),
               SizedBox(
                 width: 320.w,
                 height: 65.h,
                 child:elevatedButton(context: context,
                     color: Colors.green,
                     googleIcon: false,
                     onpressed: (){
                   controller.logout();
                     },
                     buttonName: "Phone") ,
               ),

          ],),
    );
  }
}
