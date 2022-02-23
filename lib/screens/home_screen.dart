import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:test_app/controller/sign_in_controller.dart';
import 'package:test_app/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
 final SignInController _controller = Get.find();
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 10.0.h),
                child: SizedBox(
                  width: 40.w,
                  height: 50.h,
                  child: Stack(
                    children: [
                     const FaIcon(FontAwesomeIcons.shoppingCart,color: Colors.grey,),
                      Positioned(
                        right: 10.w,
                        child: SizedBox(
                          width: 15.w,
                          height: 15.h,
                          child:const CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Text("0",style: TextStyle(
                                fontSize: 10,color: Colors.white,
                                fontWeight: FontWeight.bold),),
                            radius: 15,

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.grey),
            bottom: TabBar(
              indicatorColor: Colors.pink,
              labelColor: Colors.pink,
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 15.sp,
              fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.grey,
              tabs:const [
              Tab(text: "Salads and Soup",),
              Tab(text: "From the Barnyard",),
              Tab(text: "From the ----",),
            ],
            ),
          ),
          drawer: drawer(context: context,
          onTap: (){
            _controller.logout();
          }
          ),
          body:const TabBarView(children: [
            Text("Tab 1"),
            Text("Tab 2"),
            Text("Tab 3"),
          ]),
        ),
      ),
    );
  }
}
