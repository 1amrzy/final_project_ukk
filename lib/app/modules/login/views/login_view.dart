import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
              image: AssetImage('assets/images/font_libryverse.png'),width: 120.0,),
              Text("Help",
              style: TextStyle(
                  color: Colors.red,fontSize: 16.0,fontFamily: 'Poopins',fontWeight: FontWeight.bold),)
            ],
          ),

        ),
        body: Center(
          child: Container(
            child:
                Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextField(
                          //style: ,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFB6B3B3).withOpacity(0.4),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.circular(15.15),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(15.15)),
                            hintText: 'Email / username',
                            hintStyle: TextStyle(fontFamily: 'Poppins', color: Colors.deepOrange)
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: Obx(() => TextField(
                                obscureText: controller.showpassword.value,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color(0xFFB6B3B3).withOpacity(0.4),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(15.15),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(15.15)),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(fontFamily: 'Poppins', color: Colors.deepOrange),
                                    suffix: InkWell(
                                      child: Icon(Icons.visibility,
                                          color: Colors.grey, size: 15),
                                      onTap: () {
                                        controller.showpassword.value =
                                            !controller.showpassword.value;
                                      },
                                    )),
                              ))),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: SizedBox(
                          width: double.infinity ,height: 40.40,
                          child: Obx(() => controller.loading.value?
                          CircularProgressIndicator():
                          ElevatedButton(onPressed: (){
                            controller.login();
                          }, child: Text("Log In",style: TextStyle(
                              fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFF0000),
                              ),)
                          ),
                        )
                      ),
                    ),
                  ],
                ))
          ),
        ));
  }
}
