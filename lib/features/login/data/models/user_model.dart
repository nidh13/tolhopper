import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String? prefix;
  String? status;
  bool? hasAccount;
  String? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? salutation;
  String? title;
  String? phoneNumber;
  String? company;
  String? country;
  String? street;
  String? houseNumber;
  String? zipCode;
  String? city;
  int? customerNumber;
  String? createdAt;
  String? updatedAt;
  String? ustId;
  String? registerNumber;

  UserModel(
      {this.prefix,
      this.status,
      this.hasAccount,
      this.id,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.salutation,
      this.title,
      this.phoneNumber,
      this.company,
      this.street,
      this.houseNumber,
      this.zipCode,
      this.city,
      this.customerNumber,
      this.createdAt,
      this.updatedAt,
      this.ustId,
      this.registerNumber,
      this.country});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['_id'],
        houseNumber: json['house_number'],
        city: json['city'],
        password: json['password'],
        prefix: json['prefix'],
        status: json['status'],
        hasAccount: json['has_account'],
        street: json['street'],
        company: json['company'],
        country: json['country'],
        title: json['title'],
        salutation: json['salutation'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        customerNumber: json['customer_number'],
        phoneNumber: json['phone_number'],
        registerNumber: json['register_number'],
        ustId: json['ustid'],
        zipCode: json['zip_code']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    if (password != null) {
      data['password'] = password;
      return data;
    }
    if (firstName != null) {
      data['first_name'] = firstName;
    }
    if (lastName != null) {
      data['last_name'] = lastName;
    }
    if (salutation != null) {
      data['salutation'] = salutation;
    }
    if (title != null) {
      data['title'] = title;
    }
    if (phoneNumber != null) {
      data['phone_number'] = phoneNumber;
    }
    if (company != null) {
      data['company'] = company;
    }
    if (country != null) {
      data['country'] = country;
    }
    if (street != null) {
      data['street'] = street;
    }
    if (houseNumber != null) {
      data['house_number'] = houseNumber;
    }
    if (zipCode != null) {
      data['zip_code'] = zipCode;
    }
    if (city != null) {
      data['city'] = city;
    }
    if (customerNumber != null) {
      data['customer_number'] = customerNumber;
    }
    if (registerNumber != null) {
      data['register_number'] = registerNumber;
    }
    if (ustId != null) {
      data['ustid'] = ustId;
    }
    return data;
  }

  @override
  List<Object?> get props => [
        prefix,
        status,
        hasAccount,
        id,
        email,
        password,
        firstName,
        lastName,
        salutation,
        title,
        phoneNumber,
        company,
        country,
        street,
        houseNumber,
        zipCode,
        city,
        customerNumber,
        createdAt,
        updatedAt,
        ustId,
        registerNumber,
      ];

  String getFullName() {
    if (firstName != null && lastName != null) {
      return firstName! + " " + lastName!;
    }
    return "";
  }

  String getFullAdress() {
    if (houseNumber != null &&
        street != null &&
        zipCode != null &&
        city != null &&
        country != null) {
      return '$houseNumber $street, $zipCode $city, $country';
    }
    return "";
  }
}
