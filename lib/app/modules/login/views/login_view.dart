import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/register/controllers/register_controller.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

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
              InkWell(
                onTap: ()=> launchUrl(Uri.parse('https://www,google.com')),
                child: Text(
                  "Help", style: TextStyle(
                      color: Colors.red,fontSize: 16.0,fontFamily: 'Poopins',fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),

        // Bagian Body
        body: Center(
          child: Container(
            child:  Form(
                key: controller.formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: TextFormField(
                          controller: controller.usernameController,
                          autocorrect: true,
                          validator: (value) {
                            return EmailValidator.validate(value!) ? null : 'Masukan Email yang Valid!';
                          },
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
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          child: Obx(() => TextFormField(
                            controller: controller.passwordController,
                            autocorrect: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }return null;
                            },
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

                    SizedBox(height: 30),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: SizedBox(
                                height: 45.0,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFC8C8C8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: (){

                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.facebook,
                                    color: Color(0xFF3D5A98),
                                  ),
                                  label: Text("Facebook"),
                                ),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: SizedBox(
                                height: 45.0,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFC8C8C8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: (){

                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.google,
                                    color: Color(0xFF3D5A98),
                                  ),
                                  label: Text("Google"),
                                ),
                              )),
                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have account?",style: TextStyle(
                              fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14)),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 14)
                            ),
                            onPressed: () => Get.offAllNamed(Routes.REGISTER),
                            child: Text("Sign up",style: TextStyle(
                                fontFamily: 'Poppins',fontWeight: FontWeight.bold,color: Color(0xFFFF0000))
                            ),
                          ),
                        ],
                      ),
                    )



                  ],
                )),
          ),
        ));
  }
}
