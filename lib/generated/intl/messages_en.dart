// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new, inference_failure_on_untyped_parameter
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  final messages = _notInlinedMessages(_notInlinedMessages);

  String get localeName => 'en';

  static String m0(error) => "Download failed: ${error}";

  static String m1(fieldName) => "${fieldName} is required";

  static String m2(fieldName, min) =>
      "${fieldName} must be at least ${min} characters";

  static String m3(requirements) => "Password must contain: ${requirements}";

  static String m4(version, currentVersion) =>
      "Version ${version} is now available!\nCurrent version: ${currentVersion}\n\nWould you like to download and install the update now?";
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Erudaxis"),
        "cancelButton": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cancelDownloadButton": MessageLookupByLibrary.simpleMessage(
          "Cancel Download",
        ),
        "cancelDownloadMessage": MessageLookupByLibrary.simpleMessage(
          "Are you sure you want to cancel the download? You can always update later from settings.",
        ),
        "cancelDownloadTitle": MessageLookupByLibrary.simpleMessage(
          "Cancel Download?",
        ),
        "closeButton": MessageLookupByLibrary.simpleMessage("Close"),
        "continueDownloadButton": MessageLookupByLibrary.simpleMessage(
          "Continue Download",
        ),
        "downloadAlreadyInProgress": MessageLookupByLibrary.simpleMessage(
          "Download already in progress",
        ),
        "downloadCancelled": MessageLookupByLibrary.simpleMessage(
          "Download cancelled",
        ),
        "downloadComplete": MessageLookupByLibrary.simpleMessage(
          "Download complete",
        ),
        "downloadCompleteMessage": MessageLookupByLibrary.simpleMessage(
          "The update has been downloaded successfully. Please follow the installation prompts to complete the update.",
        ),
        "downloadCompleteTitle": MessageLookupByLibrary.simpleMessage(
          "Download Complete",
        ),
        "downloadCompletedInstalling": MessageLookupByLibrary.simpleMessage(
          "Download completed. Installing...",
        ),
        "downloadFailedError": m0,
        "downloadFailedTryAgain": MessageLookupByLibrary.simpleMessage(
          "Download failed. Please try again.",
        ),
        "downloadingStatus":
            MessageLookupByLibrary.simpleMessage("Downloading..."),
        "downloadingUpdateTitle": MessageLookupByLibrary.simpleMessage(
          "Downloading Update",
        ),
        "emailField": MessageLookupByLibrary.simpleMessage("Email"),
        "emailRequired":
            MessageLookupByLibrary.simpleMessage("Email is required"),
        "enterEmail": MessageLookupByLibrary.simpleMessage("Enter email"),
        "enterPassword": MessageLookupByLibrary.simpleMessage("Enter password"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "fieldRequired": m1,
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "gotItButton": MessageLookupByLibrary.simpleMessage("Got it"),
        "installationConflictMessage": MessageLookupByLibrary.simpleMessage(
          "The update cannot be installed because it conflicts with the current version.\n\nThis usually happens when app signatures don\'\'t match.\n\nPlease uninstall the current app first:\n1. Go to Settings > Apps\n2. Find and select \"erudaxis\"\n3. Tap \"Uninstall\"\n4. Then retry the update",
        ),
        "installationConflictTitle": MessageLookupByLibrary.simpleMessage(
          "Installation Conflict",
        ),
        "installationFailedTitle": MessageLookupByLibrary.simpleMessage(
          "Installation Failed",
        ),
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
        "minLength": m2,
        "notNowButton": MessageLookupByLibrary.simpleMessage("Not Now"),
        "openSettingsButton":
            MessageLookupByLibrary.simpleMessage("Open Settings"),
        "passwordField": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordInvalid": m3,
        "passwordLower":
            MessageLookupByLibrary.simpleMessage("lowercase letter"),
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
        "passwordUpper":
            MessageLookupByLibrary.simpleMessage("uppercase letter"),
        "permissionsRequiredMessage": MessageLookupByLibrary.simpleMessage(
          "Required permissions denied",
        ),
        "permissionsRequiredTitle": MessageLookupByLibrary.simpleMessage(
          "Permissions Required",
        ),
        "phoneRequired": MessageLookupByLibrary.simpleMessage(
          "Phone number is required",
        ),
        "preparingDownload": MessageLookupByLibrary.simpleMessage(
          "Preparing download...",
        ),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
        "studyCompanion": MessageLookupByLibrary.simpleMessage(
          "Your study companion",
        ),
        "updateAvailableMessage": m4,
        "updateAvailableTitle": MessageLookupByLibrary.simpleMessage(
          "Update Available",
        ),
        "updateCheckFailedMessage": MessageLookupByLibrary.simpleMessage(
          "Error checking for updates",
        ),
        "updateCheckFailedTitle": MessageLookupByLibrary.simpleMessage(
          "Update Check Failed",
        ),
        "updateFailedMessage": MessageLookupByLibrary.simpleMessage(
          "Error during update",
        ),
        "updateFailedTitle":
            MessageLookupByLibrary.simpleMessage("Update Failed"),
        "updateNowButton": MessageLookupByLibrary.simpleMessage("Update Now"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage(
          "Nice to see you again!",
        ),
      };
}
