import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:tollhopper/core/error/exceptions.dart';
import 'package:tollhopper/features/login/data/models/user_model.dart';
import 'package:tollhopper/global/utils/app_api.dart';

abstract class SignInUpRemoteDataSource {
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String gender,
    required String languageCode,
    required String? companyName,
    required String? country,
    required String? address,
    required String? city,
    required String? houseNumber,
    required String? postalCode,
  });
  Future<UserModel> guestRegister(
      {required String email,
      required String firstName,
      required String lastName,
      required String gender,
      required String languageCode,
      required String? companyName,
      required String? country,
      required String? address,
      required String? city,
      required String? houseNumber,
      required String? postalCode,
      required bool isGuest});
  Future<String> signIn({required String email, required String password});

  Future<Unit> restPassword(
      {required String email, required String languageCode});

  Future<UserModel> getUserById({required String token});

  Future<UserModel> updateUserModel(
      {required String? firstName,
      required String? lastName,
      required String? gender,
      required String? companyName,
      required String id,
      required String? country,
      required String? address,
      required String? city,
      required String? houseNumber,
      required String? postalCode,
      required UserModel userModel});
}

class SignInUpRemoteDataSourceImpl extends SignInUpRemoteDataSource {
  final http.Client client;

  SignInUpRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<String> signIn(
      {required String email, required String password}) async {
    final Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
    };
    final response = await client
        .post(
          Uri.parse(loginApi),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestBody),
        )
        .catchError((e) => throw ServerException());
    final responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final String token = responseData['token'];
      return token;
    } else if (response.statusCode == 401) {
      throw WrongCredentialException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String gender,
    required String languageCode,
    required String? companyName,
    required String? country,
    required String? address,
    required String? city,
    required String? houseNumber,
    required String? postalCode,
  }) async {
    Map<String, dynamic> bodyRequest = new Map<String, dynamic>();
    bodyRequest['email'] = email;
    bodyRequest['first_name'] = firstName;
    bodyRequest['last_name'] = lastName;
    bodyRequest['password'] = password;
    bodyRequest['salutation'] = gender;
    bodyRequest['is_from_mobile'] = true;
    if (companyName != null && companyName.isNotEmpty == true) {
      bodyRequest['company'] = companyName;
    }
    if (country != null && country.isNotEmpty == true) {
      bodyRequest['country'] = country;
    }
    if (address != null && address.isNotEmpty == true) {
      bodyRequest['street'] = address;
    }
    if (city != null && city.isNotEmpty == true) {
      bodyRequest['city'] = city;
    }
    if (houseNumber != null && houseNumber.isNotEmpty == true) {
      bodyRequest['house_number'] = houseNumber;
    }
    if (postalCode != null && postalCode.isNotEmpty == true) {
      bodyRequest['zip_code'] = postalCode;
    }
    final response = await client
        .post(
          Uri.parse(registerApi + languageCode),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(bodyRequest),
        )
        .catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      final responseData = UserModel.fromJson(jsonDecode(response.body));
      return responseData;
    } else if (response.statusCode == 403) {
      throw UserExistException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> restPassword(
      {required String email, required String languageCode}) async {
    final Map<String, dynamic> requestBody = {
      'email': email,
    };
    final response = await client
        .post(
          Uri.parse(resetPasswordApi + languageCode),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestBody),
        )
        .catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      return unit;
    } else if (response.statusCode == 400) {
      throw UserNotExistException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUserById({required String token}) async {
    final response = await client.get(
      Uri.parse(getUserApi + token),
      headers: {'Content-Type': 'application/json'},
    ).catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body)["customer"]);
    } else if (response.statusCode == 400) {
      throw UserNotExistException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> guestRegister(
      {required String email,
      required String firstName,
      required String lastName,
      required String gender,
      required String languageCode,
      required String? companyName,
      required String? country,
      required String? address,
      required String? city,
      required String? houseNumber,
      required String? postalCode,
      required bool isGuest}) async {
    Map<String, dynamic> bodyRequest = new Map<String, dynamic>();
    bodyRequest['email'] = email;
    bodyRequest['first_name'] = firstName;
    bodyRequest['last_name'] = lastName;
    bodyRequest['salutation'] = gender;
    bodyRequest['has_account'] = false;
    bodyRequest['is_from_mobile'] = true;
    if (companyName != null && companyName.isNotEmpty == true) {
      bodyRequest['company'] = companyName;
    }
    if (country != null && country.isNotEmpty == true) {
      bodyRequest['country'] = country;
    }
    if (address != null && address.isNotEmpty == true) {
      bodyRequest['street'] = address;
    }
    if (city != null && city.isNotEmpty == true) {
      bodyRequest['city'] = city;
    }
    if (houseNumber != null && houseNumber.isNotEmpty == true) {
      bodyRequest['house_number'] = houseNumber;
    }
    if (postalCode != null && postalCode.isNotEmpty == true) {
      bodyRequest['zip_code'] = postalCode;
    }
    final response = await client
        .post(
          Uri.parse(registerGuestApi),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(bodyRequest),
        )
        .catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      final responseData = UserModel.fromJson(jsonDecode(response.body));
      return responseData;
    } else if (response.statusCode == 400) {
      throw UserExistException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> updateUserModel(
      {required String? firstName,
      required String? lastName,
      required String? gender,
      required String? companyName,
      required String id,
      required String? country,
      required String? address,
      required String? city,
      required String? houseNumber,
      required String? postalCode,
      required UserModel userModel}) async {
    Map<String, dynamic> bodyRequest = new Map<String, dynamic>();
    if (firstName != null && firstName.isNotEmpty == true) {
      bodyRequest['first_name'] = firstName;
    }
    if (lastName != null && lastName.isNotEmpty == true) {
      bodyRequest['last_name'] = lastName;
    }
    if (gender != null && gender.isNotEmpty == true) {
      bodyRequest['salutation'] = gender;
    }
    if (companyName != null && companyName.isNotEmpty == true) {
      bodyRequest['company'] = companyName;
    }
    if (country != null && country.isNotEmpty == true) {
      bodyRequest['country'] = country;
    }
    if (address != null && address.isNotEmpty == true) {
      bodyRequest['street'] = address;
    }
    if (city != null && city.isNotEmpty == true) {
      bodyRequest['city'] = city;
    }
    if (houseNumber != null && houseNumber.isNotEmpty == true) {
      bodyRequest['house_number'] = houseNumber;
    }
    if (postalCode != null && postalCode.isNotEmpty == true) {
      bodyRequest['zip_code'] = postalCode;
    }
    final response = await client
        .put(
          Uri.parse(updateUserApi + id),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(bodyRequest),
        )
        .catchError((e) => throw ServerException());
    if (response.statusCode == 200) {
      userModel.firstName = firstName;
      userModel.lastName = lastName;
      userModel.salutation = gender;
      userModel.company = companyName;
      userModel.country = country;
      userModel.city = city;
      userModel.zipCode = postalCode;
      userModel.street = address;
      userModel.houseNumber = houseNumber;
      return userModel;
    } else if (response.statusCode == 400) {
      throw UserExistException();
    } else {
      throw ServerException();
    }
  }
}
