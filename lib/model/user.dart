import 'dart:convert';

class User {
  // Defince field
  final String id;
  final String fullName;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;

  // Constructor
  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.state,
    required this.city,
    required this.locality,
    required this.password,
  });
  //  serialization: covert User object to Map
  // Map: A Map is a collection of key value pair
  // why: converting to a map is an intermediate step that makes it eaiser to serialize
  //  the object to formate like json for storage or transmission.

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "fullName": fullName,
      "email": email,
      "state": state,
      "city": city,
      "locality": locality,
      "password": password
    };
  }

  // Serialization: convert Map into json String
  // this is method directly encodes the data from the map to json string
  // the json.encode() funtion convert a dart object (such as map or list)
  // into a jsoon String representation

  String toJson() => json.encode(toMap());

  //  Deserialization: convert a Map to a user object
  // Purpose Manipulation and user: once the data is converted to a user object it can be easily manipulated and user within the application
  // for example we might want to display to user fullname , email etc on the UI or we might want to save the data localily

  // the factory consturctor take map ( usaually obtain from a json object)
  // and convert it into user object if field is not presend in the it default to an empty string

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["_id"] as String? ?? "",
      fullName: map['fullName'] as String? ?? "",
      email: map['email'] as String? ?? "",
      state: map['state'] as String? ?? "",
      city: map['city'] as String? ?? "",
      locality: map['locality'] as String? ?? "",
      password: map['password'] as String? ?? "",
    );
  }

  factory User.formJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
