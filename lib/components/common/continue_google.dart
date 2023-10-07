import 'package:docoradi/Models/documents/documentsModel.dart';
import 'package:docoradi/components/common/DocumentDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:docoradi/controller/document_controller.dart';
import 'package:intl/intl.dart';

class ContinueWithGoogle extends StatelessWidget {
  @override
  ContinueWithGoogle({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: 241,
      child: TextButton(
          style: TextButton.styleFrom(
            shape:ContinuousRectangleBorder(),
            side: BorderSide(color: Color.fromARGB(255, 15, 15, 15), width: 2),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.g_mobiledata,
                size: 40,
              ),
              const Expanded(
                  child: Text(
                " Continue with Google",
                style: TextStyle(color: Colors.black, fontSize: 14),
              )),
            ],
          )),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }
}
