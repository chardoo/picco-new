class LoginResponseObject {
  String id = "";
  String name = "";
  String email = "";
  String role = "";
  String token = "";
  String mobile = '';

  String expiration = "";

  LoginResponseObject(this.id, this.email, this.name, this.role, this.token,
      this.expiration, this.mobile);

  LoginResponseObject.empty() {
    id = "";
    email = "";
    name = "";
    role = "";
    token = "";
    expiration = "";
    mobile = "";
  }

  //deserialization
  factory LoginResponseObject.fromJson(Map<String, dynamic> json) {
    print("jfkdfjdkfkdf");
    print(json);
    return LoginResponseObject(
      'hhhhhh',
      json["email"] as String,
      json["email"] as String,
      json["role"] as String,
      json["token"] as String,
      json["expiration"] as String,
      json["mobile"] as String,
    );
  }

  //serialization
  Map<String, dynamic> toJson() {
    var map = {
      "id": id,
      "email": email,
      "name": name,
      "role": role,
      "token": token,
      "expiration": expiration,
       "mobile": mobile,
    };
    return map;
  }

  @override
  String toString() {
    return "LoginResponseObject = [ id: $id, email: $email, role: $role, token: $token "
        "name: $name , expiration: $expiration, mobile: $mobile ]";
  }
}
