class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return 'Field can\'t be empty';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    return null;
  }

  static String? validateEmail({required String email}) {
    if (email.isEmpty) {
      return 'Email can\'t be empty';
    }

    if (!email.contains('@')) {
      return 'Email must contain @';
    }

    return null;
  }

  static String? validateConfirmPassword(
      {required String password, required String confirmPassword}) {
    if (confirmPassword.isEmpty) {
      return 'Confirm Password can\'t be empty';
    }

    if (password != confirmPassword) {
      return 'Passwords don\'t match';
    }

    return null;
  }

  static String? validateName({required String name}) {
    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }

    return null;
  }

  static String? validateAge({required String age}) {
    if (age.isEmpty) {
      return 'Age can\'t be empty';
    }

    return null;
  }

  static String? validateHeight({required String height}) {
    if (height.isEmpty) {
      return 'Height can\'t be empty';
    }

    return null;
  }

  static String? validateWeight({required String weight}) {
    if (weight.isEmpty) {
      return 'Weight can\'t be empty';
    }

    return null;
  }
}
