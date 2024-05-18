class MyValidators {
  static String? displayNamevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'الإسم لا يمكن أن يكون خالياً';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'الإسم يجب أن يكون بين ٣ إلى ٢٠ حرف';
    }

    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'رجاءاً ادخل البريد الإلكتروني';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'رجاءاً ادخل بريد إلكتروني صالح';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'رجاءاً ادخل كلمة المرور';
    }
    if (value.length < 6) {
      return 'كلمة المرور لا يمكن أن تكون أقل من ٦';
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'كلمات المرور لا تتطابق';
    }
    return null;
  }
}
