import 'package:docoradi/Models/form/formModel.dart';
import 'package:docoradi/controller/uploads_controller.dart';
import 'package:docoradi/utils/dateUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class FormFields extends StatelessWidget {
  late Map<String, dynamic> data = {};
  final UploadController uploadController = Get.put(UploadController());
  // late Map<String, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Widget getWidget(Fields properties, BuildContext context) {
    switch (properties.fieldType) {
      case 'textInput':
        return getTextField(properties);
      case 'text':
        return getTextField(properties);
      case 'number':
        return getNumberField(properties);
      case 'date':
        return getDateField(properties, context);

      default:
        return Container();
    }
  }

  Widget getTextField(Fields properties) {
    return Container(
      // margin: EdgeInsets.only(bottom: 10),
      // width: 343,
      height: 65,
      child: TextFormField(
        onChanged: (value) {
          //data.add({"name": properties.name, "value": value});
          print("hey am there");
          data[properties.name] = value;
        },
        onSaved: (value) {
          // data.add({"name": properties.name, "value": value});
          // data.add({"name": properties.name, "value": value});
          data[properties.name] = value;
          // jsonSchemaBloc.jsonDataAdd.add(data);
        },
        validator: (String? value) {
          if (properties.required) {
            if (value == null || value.isEmpty) {
              return 'Required';
            }
          }
          return null;
        },
        decoration: InputDecoration(
          helperText: '',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Color.fromARGB(255, 242, 242, 242),
          filled: true,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),
          // hintText:
          //     properties.displayName != null ? properties.displayName : '',
          labelText:
              properties.required ? properties.name + ' *' : properties.name,
        ),
      ),
    );
  }

  Widget getNumberField(Fields properties) {
    return Container(
      height: 65,
      child: TextFormField(
        onChanged: (value) {
          // print("hey am hthe rjejrr");
          // data[properties.name] = value;
        },
        keyboardType: TextInputType.number,
        onSaved: (value) {
          // Map<String, dynamic> data = Map<String, dynamic>();
          data[properties.name] = value;
          // jsonSchemaBloc.jsonDataAdd.add(data);
        },
        validator: (String? value) {
          final regexvalidation = RegExp("^[0-9]*\$");
          if (properties.required) {
            if (value == null || value.isEmpty) {
              return 'Required';
            }
          }

          return null;
        },
        decoration: InputDecoration(
          helperText: '',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Color.fromARGB(255, 242, 242, 242),
          filled: true,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),
          // hintText:
          //     properties.displayName != null ? properties.displayName : '',
          labelText:
              properties.required ? properties.name + ' *' : properties.name,
        ),
      ),
    );
  }

  Widget getDateField(Fields properties, BuildContext context) {
    TextEditingController myDate = TextEditingController();
    myDate.text = '';
    return Obx(() => Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 40,
        // width: 343,
        child: TextField(
          controller: uploadController.isDateSelected.value==true? myDate: myDate,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            // fillColor: Color.fromARGB(255, 242, 242, 242),
            filled: true,
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontFamily: "verdana_regular",
              fontWeight: FontWeight.w400,
            ),
            icon: Icon(Icons.calendar_today), //icon of text field
            labelText:
                properties.required ? properties.name + ' *' : properties.name,
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100));
            if (pickedDate != null) {
              // data[properties.name] = pickedDate;
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);

              data[properties.name] = formattedDate;
              // data.add({"name": properties.name, "value": DateTime.parse(DateFormat.yMMMd().format(pickedDate))});
              // String formattedDate =
              //     DateFormat('yyyy-MM-dd').format(pickedDate);
              uploadController.isDateSelected.value = true;
              myDate.text = formattedDate; //set output date to TextField value.

              // endDate.text = formattedDate; //set output date to TextField value
            }
          },
        )));
  }
}
