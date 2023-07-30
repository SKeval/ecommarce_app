// To parse this JSON data, do
//
//     final addUserResponse = addUserResponseFromJson(jsonString);

import 'dart:convert';

AddUserResponse addUserResponseFromJson(String str) =>
    AddUserResponse.fromJson(json.decode(str));

String addUserResponseToJson(AddUserResponse data) =>
    json.encode(data.toJson());

class AddUserResponse {
  int id;
  String email;
  String username;
  String password;
  Name name;
  Address address;
  String phone;

  AddUserResponse({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  factory AddUserResponse.fromJson(Map<String, dynamic> json) =>
      AddUserResponse(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name: Name.fromJson(json["name"]),
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "name": name.toJson(),
        "address": address.toJson(),
        "phone": phone,
      };
}

class Address {
  String city;
  String street;
  int number;
  String zipcode;

  Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        street: json["street"],
        number: json["number"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
        "number": number,
        "zipcode": zipcode,
      };
}

class Name {
  String firstname;
  String lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
      };
}
