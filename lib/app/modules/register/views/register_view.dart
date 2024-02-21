import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
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
                          child: TextFormField(
                            autocorrect: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }return null;
                            },
                            //style:
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
                                hintText: 'Nama Lengkap',
                                hintStyle: TextStyle(fontFamily: 'Poppins', color: Colors.deepOrange)
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            autocorrect: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }return null;
                            },
                            //style:
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
                                hintText: 'Username',
                                hintStyle: TextStyle(fontFamily: 'Poppins', color: Colors.deepOrange)
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                                hintText: 'Email',
                                hintStyle: TextStyle(fontFamily: 'Poppins', color: Colors.deepOrange)
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                            child: Obx(() => TextFormField(
                              controller: controller.passwordcontroller,
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
                                controller.register();
                              }, child: Text("Next",style: TextStyle(
                                  fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFF0000),
                                ),)
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have account?",style: TextStyle(
                              fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14)),
                          TextButton(
                            style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 14)
                            ),
                            onPressed: () => Get.offAllNamed(Routes.LOGIN),
                            child: Text("Log in",style: TextStyle(
                                fontFamily: 'Poppins',fontWeight: FontWeight.bold,color: Colors.black)
                            ),
                          ),
                        ],
                      )
                      ,
                    ],
                  ))
          ),
        )

    );
  }
}
