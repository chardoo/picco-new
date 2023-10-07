// ignore: file_names
class Schema {
  late String name;
  late String namespace;
  late String description;
  late List<Fields> fields;
  // Commented

  Schema({required this.name, required this.namespace, required this.description, required this.fields});

  factory Schema.fromMap(Map<String, dynamic> json) {
    return Schema(
        name: json["name"],
        namespace: json["namespace"],
        description: json["description"],
        fields: List<Fields>.from( json['fields']
            ?.map((dynamic p) => Fields.fromMap(p) as Fields)
            .toList()));
  }

  @override
  String toString() {
    return "{ name: $name}";
  }
}

class Fields {
  late String fieldType;
  late String name;
  late String displayName;
  late bool required;
  // Commented
  Fields(this.name, this.fieldType, this.displayName, this.required);
  factory Fields.fromMap(Map<String, dynamic> json) {
    // print(json);
    return Fields(
        json["name"], json["fieldType"], json["displayName"], json["required"]);
  }
}
