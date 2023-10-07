/*
{
  email: "",
  firstName: "",
  lastName: "",
  mobile: "",
  password: "",
  
}
*/

import 'package:cloud_firestore/cloud_firestore.dart';

class Documents {
  final String documentURL;
  final String ?firstName;
  final String objectID;
  final String companyName;
  final bool ?isLater;
  final bool? isViewed;
  final String createdTime;
  final String mime;

  Documents({
     required this.documentURL,
     required this.firstName,
      required this.objectID,
      required this.companyName,
      this.isLater,
      this.isViewed,
   required   this.createdTime,
    required  this.mime});

  //deserialization
  factory Documents.fromMap(Map<String, dynamic> json) {
    return Documents(
      documentURL:  json["documentURL"],
    firstName:    json["firstName"],
      objectID:  json["objectID"],
    companyName:    json["companyName"]?? '',
       isLater:  json?["isLater"] ?? false,
      isViewed:  json?["isViewed"] ??  false,
      createdTime:  json["createdTime"]  ?? '',
      mime:  json["mime"]?? '');
  }
  Map<String, dynamic> toJson() => {
        "documentURL": documentURL,
        "firstName": firstName,

        "objectID": objectID,
        "companyName": companyName,
        "isLater": isLater,
        "isViewed": isViewed,
        "createdTime": createdTime,
        "mime": mime,
      };

  //serialization

  @override
  String toString() {
    return "{ documentURL: $documentURL, firstName: $firstName,  objectID: $objectID "
        "companyName: $companyName, isLater: $isLater, isViewed: $isViewed, createdTime: $createdTime, mime: $mime}";
  }
}

class PersonalDocuments {
  final String documentURL;
  final String firstName;
  final String lastName;
  final String objectID;
  final String companyName;
  final bool isLater;
  final bool isViewed;
  final String createdTime;
  final String mime;
  final bool isPersonal;

  PersonalDocuments(
      this.documentURL,
      this.firstName,
      this.lastName,
      this.objectID,
      this.companyName,
      this.isLater,
      this.isViewed,
      this.createdTime,
      this.mime,
      this.isPersonal);

  //deserialization
  factory PersonalDocuments.fromMap(Map<String, dynamic> json) {
    return PersonalDocuments(
        json["documentURL"],
        json["firstName"],
        json["lastName"],
        json["objectID"],
        json["companyName"],
        json["isLater"],
        json["isViewed"],
        json["createdTime"],
        json["mime"],
        true,
        );
  }
  Map<String, dynamic> toJson() => {
        "documentURL": documentURL,
        "firstName": firstName,
        "lastName": lastName,
        "objectID": objectID,
        "companyName": companyName,
        "isLater": isLater,
        "isViewed": isViewed,
        "createdTime": createdTime,
        "mime": mime,
      };

  //serialization

  @override
  String toString() {
    return "{ documentURL: $documentURL, firstName: $firstName, lastName: $lastName, objectID: $objectID "
        "companyName: $companyName, isLater: $isLater, isViewed: $isViewed, createdTime: $createdTime, mime: $mime}";
  }
}

class DocumentResponse {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

 DocumentResponse(this.doc);
  Documents get document => Documents.fromMap(doc.data());
}
