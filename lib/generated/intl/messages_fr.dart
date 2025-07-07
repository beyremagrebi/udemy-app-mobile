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

  static String m0(error) => "Échec du téléchargement : ${error}";

  static String m1(fieldName) => "${fieldName} est requis";

  static String m2(fieldName, min) =>
      "${fieldName} doit comporter au moins ${min} caractères";

  static String m3(requirements) =>
      "Le mot de passe doit contenir : ${requirements}";

  static String m4(version, currentVersion) =>
      "La version ${version} est maintenant disponible !\nVersion actuelle : ${currentVersion}\n\nVoulez-vous télécharger et installer la mise à jour maintenant ?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appName": MessageLookupByLibrary.simpleMessage("Erudaxis"),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Annuler"),
    "cancelDownloadButton": MessageLookupByLibrary.simpleMessage(
      "Annuler le téléchargement",
    ),
    "cancelDownloadMessage": MessageLookupByLibrary.simpleMessage(
      "Êtes-vous sûr de vouloir annuler le téléchargement ? Vous pouvez toujours mettre à jour plus tard depuis les paramètres.",
    ),
    "cancelDownloadTitle": MessageLookupByLibrary.simpleMessage(
      "Annuler le téléchargement ?",
    ),
    "closeButton": MessageLookupByLibrary.simpleMessage("Fermer"),
    "continueDownloadButton": MessageLookupByLibrary.simpleMessage(
      "Continuer le téléchargement",
    ),
    "downloadAlreadyInProgress": MessageLookupByLibrary.simpleMessage(
      "Téléchargement déjà en cours",
    ),
    "downloadCancelled": MessageLookupByLibrary.simpleMessage(
      "Téléchargement annulé",
    ),
    "downloadComplete": MessageLookupByLibrary.simpleMessage(
      "Téléchargement terminé",
    ),
    "downloadCompleteMessage": MessageLookupByLibrary.simpleMessage(
      "La mise à jour a été téléchargée avec succès. Veuillez suivre les invites d\'\'installation pour terminer la mise à jour.",
    ),
    "downloadCompleteTitle": MessageLookupByLibrary.simpleMessage(
      "Téléchargement terminé",
    ),
    "downloadCompletedInstalling": MessageLookupByLibrary.simpleMessage(
      "Téléchargement terminé. Installation en cours...",
    ),
    "downloadFailedError": m0,
    "downloadFailedTryAgain": MessageLookupByLibrary.simpleMessage(
      "Échec du téléchargement. Veuillez réessayer.",
    ),
    "downloadingUpdateTitle": MessageLookupByLibrary.simpleMessage(
      "Téléchargement de la mise à jour",
    ),
    "emailField": MessageLookupByLibrary.simpleMessage("E-mail"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "L\'\'adresse e-mail est requise",
    ),
    "enterEmail": MessageLookupByLibrary.simpleMessage("Entrez votre email"),
    "enterPassword": MessageLookupByLibrary.simpleMessage(
      "Entrez votre mot de passe",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Erreur"),
    "fieldRequired": m1,
    "forgotPassword": MessageLookupByLibrary.simpleMessage(
      "Mot de passe oublié ?",
    ),
    "gotItButton": MessageLookupByLibrary.simpleMessage("Compris"),
    "installationConflictMessage": MessageLookupByLibrary.simpleMessage(
      "La mise à jour ne peut pas être installée car elle entre en conflit avec la version actuelle.\n\nCela se produit généralement lorsque les signatures d\'\'application ne correspondent pas.\n\nVeuillez d\'abord désinstaller l\'application actuelle :\n1. Allez dans Paramètres > Applications\n2. Trouvez et sélectionnez \"erudaxis\"\n3. Appuyez sur \"Désinstaller\"\n4. Puis réessayez la mise à jour",
    ),
    "installationConflictTitle": MessageLookupByLibrary.simpleMessage(
      "Conflit d\'\'installation",
    ),
    "installationFailedTitle": MessageLookupByLibrary.simpleMessage(
      "Échec de l\'\'installation",
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
    "minLength": m2,
    "notNowButton": MessageLookupByLibrary.simpleMessage("Pas maintenant"),
    "openSettingsButton": MessageLookupByLibrary.simpleMessage(
      "Ouvrir les paramètres",
    ),
    "passwordField": MessageLookupByLibrary.simpleMessage("Mot de passe"),
    "passwordInvalid": m3,
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
    "permissionsRequiredMessage": MessageLookupByLibrary.simpleMessage(
      "Autorisations requises refusées",
    ),
    "permissionsRequiredTitle": MessageLookupByLibrary.simpleMessage(
      "Autorisations requises",
    ),
    "phoneRequired": MessageLookupByLibrary.simpleMessage(
      "Le numéro de téléphone est requis",
    ),
    "rememberMe": MessageLookupByLibrary.simpleMessage("Se souvenir de moi"),
    "studyCompanion": MessageLookupByLibrary.simpleMessage(
      "Votre compagnon d\'\'études",
    ),
    "updateAvailableMessage": m4,
    "updateAvailableTitle": MessageLookupByLibrary.simpleMessage(
      "Mise à jour disponible",
    ),
    "updateCheckFailedMessage": MessageLookupByLibrary.simpleMessage(
      "Erreur lors de la vérification des mises à jour",
    ),
    "updateCheckFailedTitle": MessageLookupByLibrary.simpleMessage(
      "Échec de la vérification de mise à jour",
    ),
    "updateFailedMessage": MessageLookupByLibrary.simpleMessage(
      "Erreur lors de la mise à jour",
    ),
    "updateFailedTitle": MessageLookupByLibrary.simpleMessage(
      "Échec de la mise à jour",
    ),
    "updateNowButton": MessageLookupByLibrary.simpleMessage(
      "Mettre à jour maintenant",
    ),
    "welcomeBack": MessageLookupByLibrary.simpleMessage(
      "Content de vous revoir !",
    ),
  };
}
