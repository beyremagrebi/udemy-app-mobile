// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(fieldName) => "حقل ${fieldName} مطلوب";

  static String m1(fieldName, min) =>
      "يجب أن يحتوي ${fieldName} على ${min} أحرف على الأقل";

  static String m2(requirements) =>
      "يجب أن تحتوي كلمة المرور على: ${requirements}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appName": MessageLookupByLibrary.simpleMessage("إيروداكسيس"),
    "emailField": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني مطلوب",
    ),
    "enterEmail": MessageLookupByLibrary.simpleMessage(
      "أدخل البريد الإلكتروني",
    ),
    "enterPassword": MessageLookupByLibrary.simpleMessage("أدخل كلمة المرور"),
    "error": MessageLookupByLibrary.simpleMessage("خطأ"),
    "fieldRequired": m0,
    "forgotPassword": MessageLookupByLibrary.simpleMessage(
      "هل نسيت كلمة المرور؟",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال بريد إلكتروني صالح",
    ),
    "invalidPhone": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رقم هاتف صالح",
    ),
    "loading": MessageLookupByLibrary.simpleMessage("جارٍ التحميل..."),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "loginToContinue": MessageLookupByLibrary.simpleMessage(
      "سجّل الدخول للمتابعة",
    ),
    "minLength": m1,
    "passwordField": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "passwordInvalid": m2,
    "passwordLower": MessageLookupByLibrary.simpleMessage("حرف صغير"),
    "passwordMin": MessageLookupByLibrary.simpleMessage("8 أحرف على الأقل"),
    "passwordNumber": MessageLookupByLibrary.simpleMessage("رقم"),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور مطلوبة",
    ),
    "passwordSpecial": MessageLookupByLibrary.simpleMessage("رمز خاص"),
    "passwordUpper": MessageLookupByLibrary.simpleMessage("حرف كبير"),
    "phoneRequired": MessageLookupByLibrary.simpleMessage("رقم الهاتف مطلوب"),
    "rememberMe": MessageLookupByLibrary.simpleMessage("تذكرني"),
    "studyCompanion": MessageLookupByLibrary.simpleMessage("رفيق دراستك"),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("سعداء برؤيتك مجددًا!"),
  };
}
