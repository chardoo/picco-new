import 'package:flutter/cupertino.dart';

const me = {
  "title": "Game of Thrones fans",
  "description": "A simple form to register GOT fans",
  "type": "object",
  "required": ["firstname", "email", "tos"],
  "properties": {
    "firstname": {"type": "string", "title": "First Name", "default": "Jon"},
    "lastname": {"type": "string", "title": "Last Name"},
    "email": {
      "type": "string",
      "title": "Email",
      "default": "jon.snow@got.com"
    },
    "tos": {
      "type": "boolean",
      "title": "I agree not to spoil anyone",
      "default": false
    }
  }
};
