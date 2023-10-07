import 'package:docoradi/components/common/continue_google.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:docoradi/controller/signUp_controller.dart';

// ignore: use_key_in_widget_constructors
class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());
  static const colorizeTextStyle =
      TextStyle(fontSize: 25.0, fontFamily: 'SF', color: Colors.redAccent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            body: (ListView(
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
                        child: const Text("Let's get Started",
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
                            "Create an account and get best \nfeatures ",
                            softWrap: true,
                            style: TextStyle(),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              children: [
                                Obx(() => Container(
                                      child: (controller.isError.value == true)
                                          ? Text(
                                              "Register Again,Something went Wrong",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20),
                                            )
                                          : Text(" "),
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
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
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
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
                                Container(
                                    width: 343,
                                    child: TextFormField(
                                      controller: controller.contactController,
                                      validator: (value) =>
                                          controller.contactValidator(value),
                                      decoration: InputDecoration(
                                        focusColor: Colors.white,
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        fillColor:
                                            Color.fromARGB(255, 255, 254, 254),
                                        filled: true,
                                        labelText: 'Mobile',
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
                                        controller:
                                            controller.passwordController,
                                        validator: (value) =>
                                            controller.passwordValidator(value),
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
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
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
                                  height: 20,
                                ),
                                Obx(
                                  () => Container(
                                    width: 343,
                                    child: TextFormField(
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
                                              print("hote");
                                              print(
                                                  controller.ispasswordHidden);
                                            },
                                          ),
                                          focusColor: Colors.white,
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.grey,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          fillColor: Color.fromARGB(
                                              255, 255, 254, 254),
                                          filled: true,
                                          labelText: 'Confirm Password',
                                          //lable style
                                          labelStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontFamily: "verdana_regular",
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    Text(
                                      "I agree with",
                                      style: TextStyle(color: Colors.black12),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        print("richCode");
                                      },
                                      child: Text(
                                        "Terms & conditions",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                   height: 50,
                                    width: 343,
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 18, 19, 19),
                                          backgroundColor:
                                              Color.fromARGB(255, 18, 19, 19),
                                        ),
                                        onPressed: () async {
                                          if (controller.formKey.currentState!
                                              .validate()) {
                                            var login =
                                                await controller.register();
                                            if (login == true) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 8, 8, 8),
                                                      content:
                                                          Text('Success')));
                                              Get.offNamed('/login');
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
                                          "Sign Up",
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
                                          Get.offNamed('/');
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
            ]))));
  }
}
