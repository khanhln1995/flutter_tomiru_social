import 'package:flutter/material.dart';

class SignupState extends ChangeNotifier {
  String _username = '';
  String _dateOfBirth = '';
  String _gender = '';
  String _phoneNumber = '';
  String _email = '';
  String _password = '';
  String _referralCode = '';

  String get username => _username;
  set username(String value) {
    _username = value;
    notifyListeners();
  }

  String get dateOfBirth => _dateOfBirth;
  set dateOfBirth(String value) {
    _dateOfBirth = value;
    notifyListeners();
  }

  String get gender => _gender;
  set gender(String value) {
    _gender = value;
    notifyListeners();
  }

  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String get referralCode => _referralCode;
  set referralCode(String value) {
    _referralCode = value;
    notifyListeners();
  }
}
