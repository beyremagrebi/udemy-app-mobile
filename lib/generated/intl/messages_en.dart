// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(fieldName) => "${fieldName} is required";

  static String m1(fieldName, min) =>
      "${fieldName} must be at least ${min} characters";

  static String m2(requirements) => "Password must contain: ${requirements}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appName": MessageLookupByLibrary.simpleMessage("Erudaxis"),
    "emailField": MessageLookupByLibrary.simpleMessage("Email"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("Email is required"),
    "enterEmail": MessageLookupByLibrary.simpleMessage("Enter email"),
    "enterPassword": MessageLookupByLibrary.simpleMessage("Enter password"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "fieldRequired": m0,
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot password?"),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address",
    ),
    "invalidPhone": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid phone number",
    ),
    "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginToContinue": MessageLookupByLibrary.simpleMessage(
      "Log in to continue",
    ),
    "minLength": m1,
    "passwordField": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordInvalid": m2,
    "passwordLower": MessageLookupByLibrary.simpleMessage("lowercase letter"),
    "passwordMin": MessageLookupByLibrary.simpleMessage(
      "at least 8 characters",
    ),
    "passwordNumber": MessageLookupByLibrary.simpleMessage("number"),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "passwordSpecial": MessageLookupByLibrary.simpleMessage(
      "special character",
    ),
    "passwordUpper": MessageLookupByLibrary.simpleMessage("uppercase letter"),
    "phoneRequired": MessageLookupByLibrary.simpleMessage(
      "Phone number is required",
    ),
    "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
    "studyCompanion": MessageLookupByLibrary.simpleMessage(
      "Your study companion",
    ),
    "welcomeBack": MessageLookupByLibrary.simpleMessage(
      "Nice to see you again!",
    ),
  };
}
