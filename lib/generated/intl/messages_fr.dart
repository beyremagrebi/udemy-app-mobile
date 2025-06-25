// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(fieldName) => "${fieldName} est requis";

  static String m1(fieldName, min) =>
      "${fieldName} doit comporter au moins ${min} caractères";

  static String m2(requirements) =>
      "Le mot de passe doit contenir : ${requirements}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "emailField": MessageLookupByLibrary.simpleMessage("E-mail"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "L\'\'adresse e-mail est requise",
    ),
    "enterEmail": MessageLookupByLibrary.simpleMessage("Entrez votre email"),
    "enterPassword": MessageLookupByLibrary.simpleMessage(
      "Entrez votre mot de passe",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Erreur"),
    "fieldRequired": m0,
    "forgotPassword": MessageLookupByLibrary.simpleMessage(
      "Mot de passe oublié ?",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer une adresse e-mail valide",
    ),
    "invalidPhone": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer un numéro de téléphone valide",
    ),
    "loading": MessageLookupByLibrary.simpleMessage("Chargement..."),
    "login": MessageLookupByLibrary.simpleMessage("Se connecter"),
    "loginToContinue": MessageLookupByLibrary.simpleMessage(
      "Connectez-vous pour continuer",
    ),
    "minLength": m1,
    "passwordField": MessageLookupByLibrary.simpleMessage("Mot de passe"),
    "passwordInvalid": m2,
    "passwordLower": MessageLookupByLibrary.simpleMessage(
      "une lettre minuscule",
    ),
    "passwordMin": MessageLookupByLibrary.simpleMessage(
      "au moins 8 caractères",
    ),
    "passwordNumber": MessageLookupByLibrary.simpleMessage("un chiffre"),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Le mot de passe est requis",
    ),
    "passwordSpecial": MessageLookupByLibrary.simpleMessage(
      "un caractère spécial",
    ),
    "passwordUpper": MessageLookupByLibrary.simpleMessage(
      "une lettre majuscule",
    ),
    "phoneRequired": MessageLookupByLibrary.simpleMessage(
      "Le numéro de téléphone est requis",
    ),
    "rememberMe": MessageLookupByLibrary.simpleMessage("Se souvenir de moi"),
    "studyCompanion": MessageLookupByLibrary.simpleMessage(
      "Votre compagnon d\'\'études",
    ),
    "welcomeBack": MessageLookupByLibrary.simpleMessage(
      "Content de vous revoir !",
    ),
  };
}
