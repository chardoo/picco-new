import 'package:docoradi/components/common/continue_google.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:docoradi/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  static const colorizeTextStyle =
      TextStyle(fontSize: 25.0, fontFamily: 'SF', color: Colors.redAccent);
  bool secureTest = true;
  bool isError = false;
  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Docoradi",
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Color.fromARGB(255, 230, 233, 239),
        ),
        backgroundColor: Color.fromARGB(255, 230, 233, 239),
        body: body(context));
  }

  Widget body(context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 230, 233, 239),
            body: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        // alignment: AlignmentGeometry.lerp(a, b, t)
                        margin: const EdgeInsets.only(
                            left: 30, bottom: 15, top: 15),
                        child: const Text("Let's sign you in.",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Welcome back, \nyou've been missed! ",
                            softWrap: true,
                            style: TextStyle(),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 74,
                  ),
                  Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Obx(() => Container(
                                child: (controller.isError.value == true)
                                    ? Text(
                                        "Invalid Credentials",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 20),
                                      )
                                    : Text(" "),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              children: [
                                Container(
                                    width: 343,
                                    child: TextFormField(
                                      controller: controller.emailController,
                                      validator: (value) =>
                                          controller.emailValidator(value),
                                      decoration: InputDecoration(
                                        focusColor: Colors.white,
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none),
                                        fillColor:
                                            Color.fromARGB(255, 255, 254, 254),
                                        filled: true,
                                        labelText: 'UserName or Email',
                                        //lable style
                                        labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontFamily: "verdana_regular",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(
                                  () => Container(
                                      width: 343,
                                      child: TextFormField(
                                        validator: (value) =>
                                            controller.passwordValidator(value),
                                        controller:
                                            controller.passwordController,
                                        obscureText:
                                            controller.ispasswordHidden.value,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(Icons.visibility),
                                            onPressed: () {
                                              controller
                                                      .ispasswordHidden.value =
                                                  !(controller
                                                      .ispasswordHidden.value);
                                            },
                                          ),
                                          focusColor: Colors.white,
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.grey,
                                          ),

                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide.none),
                                          fillColor: Color.fromARGB(
                                              255, 255, 254, 254),
                                          filled: true,
                                          labelText: 'Password',
                                          //lable style
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontFamily: "verdana_regular",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Forget Password",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                SizedBox(
                                    width: 343,
                                    height: 50,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                        
                                          backgroundColor:
                                              Color.fromARGB(255, 18, 19, 19),
                                        ),
                                        onPressed: () async {
                                          if (controller.formKey.currentState!
                                              .validate()) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    duration:
                                                        Duration(hours: 2),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 8, 8, 8),
                                                    content: Text(
                                                        'loggin In .....')));
                                            bool login =
                                                await controller.login();
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            if (login == true) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 8, 8, 8),
                                                      content:
                                                          Text('Success')));
                                              Get.offNamed('/home');
                                            } else {
                                              controller.isError.value = true;
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 8, 8, 8),
                                                      content: Text(
                                                          'Sorry Login Failed')));
                                            }
                                          }
                                        },
                                        child: Text(
                                          "Login",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                SizedBox(
                                  height: 20,
                                ),
                               ContinueWithGoogle(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have account Google?",
                                        style: TextStyle(fontSize: 15)),
                                    TextButton(
                                        onPressed: () {
                                          Get.offNamed('/signUp');
                                        },
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ))
            ])));
  }
}
