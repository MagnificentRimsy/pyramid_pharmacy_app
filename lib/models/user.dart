// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.altPhone,
        this.address,
        this.state,
        this.city,
        this.landmark,
        this.image,
        this.maritalStatus,
        this.firstname,
        this.surname,
        this.dob,
        this.gender,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String email;
    String phone;
    dynamic altPhone;
    dynamic address;
    dynamic state;
    dynamic city;
    dynamic landmark;
    dynamic image;
    dynamic maritalStatus;
    String firstname;
    String surname;
    dynamic dob;
    dynamic gender;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        altPhone: json["alt_phone"],
        address: json["address"],
        state: json["state"],
        city: json["city"],
        landmark: json["landmark"],
        image: json["image"],
        maritalStatus: json["marital_status"],
        firstname: json["firstname"],
        surname: json["surname"],
        dob: json["dob"],
        gender: json["gender"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "alt_phone": altPhone,
        "address": address,
        "state": state,
        "city": city,
        "landmark": landmark,
        "image": image,
        "marital_status": maritalStatus,
        "firstname": firstname,
        "surname": surname,
        "dob": dob,
        "gender": gender,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
