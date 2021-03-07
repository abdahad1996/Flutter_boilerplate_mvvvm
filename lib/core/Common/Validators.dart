class Validators {
  static String validateName(String value) {
    if (value.length < 3) return 'Full Name is required';
    if (value.length > 25)
      return 'Name is too long';
    else if (value.contains('  '))
      return 'Double space is not allowed between name';
    else
      return null;
  }

  static String validateMobile(String value) {
    if (value.length == 0) return 'Phone number is required';
    if (value.substring(1).contains('+')) return 'Invalid phone number';
    if (value.length < 6) return 'Please enter a valid phone number';
    if (value.length > 10) return 'Phone number cannot be more than 10 digits';
    if (value.contains('-'))
      return 'Only numbers are allowed';
    else
      return null;
  }

  static String validatePassword(String value) {
    if (value.length == 0)
      return 'Password is required';
    else
      return null;
  }

  static String validateNewPassword(String value) {
    if (value.length == 0)
      return 'New Password is required';
    else
      return null;
  }

  static String validateConfirmPassword(String value) {
    if (value.length == 0)
      return 'Confirm Password is required';
    else
      return null;
  }

  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Please enter valid email address';
    else
      return null;
  }

  static String validateField(String value) {
    if (value.length == 0)
      return 'Required';
    else
      return null;
  }

  static String validateCardNum(String input) {
    if (input.isEmpty) {
      return 'Required';
    }

   var cleaninput = Validators.getCleanedNumber(input);

    if (cleaninput.length < 8) {
      return 'number is invalid ';
    }

    int sum = 0;
    int length = cleaninput.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(cleaninput[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return 'number is invalid ';
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = new RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static String validateGraduationYear(String value) {
    if (value.length == 0)
      return 'Graduate Year is required';
    else if (value.contains('-'))
      return 'Only numbers are allowed';
    else if (value.length != 4)
      return 'Example: 2005';
    else
      return null;
  }
}
