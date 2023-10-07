import 'package:docoradi/controller/userProfile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:get/get_core/src/get_main.dart';
import 'package:docoradi/controller/login_controller.dart';

class AccountNavigationScreen extends StatelessWidget {
  final UserController controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 233, 239),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Account",
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Color.fromARGB(255, 230, 233, 239),
        ),
        body: Container(
          color: Color.fromARGB(255, 230, 233, 239),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.only(left: 16, right: 16, top: 23),
            height: 544,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Richard Appiah'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text(controller.email),
                ),
                ListTile(
                  leading: Icon(Icons.contacts),
                  title: Text(controller.Mobile),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Setting'),
                ),
                SizedBox(
                  height: 200,
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: TextButton(
                      onPressed: () {
                        print("heello");
                        AlertDialog(
                          content: Text('Are you Sure You Want to Log Out'),
                          actions: [
                            // FlatButton(
                            //   textColor: Colors.black,
                            //   onPressed: () {},
                            //   child: Text('CANCEL'),
                            // ),
                            // FlatButton(
                            //   textColor: Colors.black,
                            //   onPressed: () {},
                            //   child: Text('ACCEPT'),
                            // ),
                          ],
                        );
                      },
                      child: Text("Log Out")),
                  // onTap: () {
                  //   Expanded(
                  //       child: AlertDialog(
                  //     content: Text('Are you Sure You Want to Log Out'),
                  //     actions: [
                  //       FlatButton(
                  //         textColor: Colors.black,
                  //         onPressed: () {},
                  //         child: Text('CANCEL'),
                  //       ),
                  //       FlatButton(
                  //         textColor: Colors.black,
                  //         onPressed: () {},
                  //         child: Text('ACCEPT'),
                  //       ),
                  //     ],
                  //   ));
                  // },
                ),
              ],
            ),
          ),
        ));
  }
}
