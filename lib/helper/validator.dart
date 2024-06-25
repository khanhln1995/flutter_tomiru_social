class Validator {
  bool _isNumeric(String s) {
    for (int i = 0; i < s.length; i++) {
      if (double.tryParse(s[i]) != null) {
        return true;
      }
    }
    return false;
  }

  String? validateEmail(String s) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(s)) {
      return 'Please enter an email!';
    } else {
      return null;
    }
  }

  String? validateName(String s) {
    if (_isNumeric(s)) {
      return 'Invalid Name!';
    }
    if (s.isEmpty) {
      return 'Don\'t forget your name!';
    }
    return null;
  }

  String? validatePassword(String s) {
    if (s.isEmpty) {
      return 'Gotta be secure, enter a password!';
    }
    return null;
  }

  bool isValidPassword(String input) {
    if (input != '' && input.length > 8) {
      RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
      bool containsSpecialChar = specialCharRegex.hasMatch(input);
      bool containsSpace = input.contains(' ');
      return !containsSpecialChar && !containsSpace;
    }
    return false;
  }

  bool? validatePhone(String phone) {
    if (phone.length > 8 && phone.startsWith('0')) {
      return true;
    }
    return false;
  }

  bool validCurrentCodeOTP(List<String> input) {
    if (input.isEmpty) {
      return false;
    }
    for (String otp in input) {
      if (int.tryParse(otp) == null) {
        return false;
      }
    }
    return true;
  }
}
