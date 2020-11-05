import 'dart:convert';

import 'package:flutter_course_haxx_app/models/user.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  Future<Map<String, dynamic>> register(String email, String password) async {
    String message = "";
    bool hasError = false;
    User _authenticatedUser;

    Map<String, dynamic> authData = {
      "email": email,
      "password": password,
      "returnSecureToken": true,
    };

    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    var response = await http.post(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA2AShNfdR2T3qVJBH-tixhKZ2KrLlNKns",
        headers: headers,
        body: json.encode(authData));

    Map<String, dynamic> responseBody = json.decode(response.body);

    if (responseBody.containsKey("idToken")) {
      _authenticatedUser = User(
        id: responseBody["localId"],
        token: responseBody["idToken"],
        email: responseBody["email"],
        userType: "customer",
      );

      message = "Account created successfully";
    } else {
      hasError = true;
      if (responseBody["error"]["message"] == "EMAIL_EXISTS") {
        message = "Email already exists";
      } else if (responseBody["error"]["message"] == "EMAIL_NOT_FOUND") {
        message = "Email not found";
      } else if (responseBody["error"]["message"] == "INVALID_PASSWORD") {
        message = "password does not match the email";
      }
    }

    return {"message": message, "hasError": hasError};
  }
}
