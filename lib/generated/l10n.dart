// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Erudaxis`
  String get appName {
    return Intl.message('Erudaxis', name: 'appName', desc: '', args: []);
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message('Cancel', name: 'cancelButton', desc: '', args: []);
  }

  /// `Cancel Download`
  String get cancelDownloadButton {
    return Intl.message(
      'Cancel Download',
      name: 'cancelDownloadButton',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel the download? You can always update later from settings.`
  String get cancelDownloadMessage {
    return Intl.message(
      'Are you sure you want to cancel the download? You can always update later from settings.',
      name: 'cancelDownloadMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Download?`
  String get cancelDownloadTitle {
    return Intl.message(
      'Cancel Download?',
      name: 'cancelDownloadTitle',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get closeButton {
    return Intl.message('Close', name: 'closeButton', desc: '', args: []);
  }

  /// `Continue Download`
  String get continueDownloadButton {
    return Intl.message(
      'Continue Download',
      name: 'continueDownloadButton',
      desc: '',
      args: [],
    );
  }

  /// `Download already in progress`
  String get downloadAlreadyInProgress {
    return Intl.message(
      'Download already in progress',
      name: 'downloadAlreadyInProgress',
      desc: '',
      args: [],
    );
  }

  /// `Download cancelled`
  String get downloadCancelled {
    return Intl.message(
      'Download cancelled',
      name: 'downloadCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Download complete`
  String get downloadComplete {
    return Intl.message(
      'Download complete',
      name: 'downloadComplete',
      desc: '',
      args: [],
    );
  }

  /// `Download completed. Installing...`
  String get downloadCompletedInstalling {
    return Intl.message(
      'Download completed. Installing...',
      name: 'downloadCompletedInstalling',
      desc: '',
      args: [],
    );
  }

  /// `The update has been downloaded successfully. Please follow the installation prompts to complete the update.`
  String get downloadCompleteMessage {
    return Intl.message(
      'The update has been downloaded successfully. Please follow the installation prompts to complete the update.',
      name: 'downloadCompleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Download Complete`
  String get downloadCompleteTitle {
    return Intl.message(
      'Download Complete',
      name: 'downloadCompleteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Download failed: {error}`
  String downloadFailedError(String error) {
    return Intl.message(
      'Download failed: $error',
      name: 'downloadFailedError',
      desc: 'Download failed with specific error message',
      args: [error],
    );
  }

  /// `Download failed. Please try again.`
  String get downloadFailedTryAgain {
    return Intl.message(
      'Download failed. Please try again.',
      name: 'downloadFailedTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Downloading...`
  String get downloadingStatus {
    return Intl.message(
      'Downloading...',
      name: 'downloadingStatus',
      desc: '',
      args: [],
    );
  }

  /// `Downloading Update`
  String get downloadingUpdateTitle {
    return Intl.message(
      'Downloading Update',
      name: 'downloadingUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailField {
    return Intl.message('Email', name: 'emailField', desc: '', args: []);
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter email`
  String get enterEmail {
    return Intl.message('Enter email', name: 'enterEmail', desc: '', args: []);
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `{fieldName} is required`
  String fieldRequired(Object fieldName) {
    return Intl.message(
      '$fieldName is required',
      name: 'fieldRequired',
      desc: '',
      args: [fieldName],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get gotItButton {
    return Intl.message('Got it', name: 'gotItButton', desc: '', args: []);
  }

  /// `The update cannot be installed because it conflicts with the current version.\n\nThis usually happens when app signatures don''t match.\n\nPlease uninstall the current app first:\n1. Go to Settings > Apps\n2. Find and select "erudaxis"\n3. Tap "Uninstall"\n4. Then retry the update`
  String get installationConflictMessage {
    return Intl.message(
      'The update cannot be installed because it conflicts with the current version.\n\nThis usually happens when app signatures don\'\'t match.\n\nPlease uninstall the current app first:\n1. Go to Settings > Apps\n2. Find and select "erudaxis"\n3. Tap "Uninstall"\n4. Then retry the update',
      name: 'installationConflictMessage',
      desc: '',
      args: [],
    );
  }

  /// `Installation Conflict`
  String get installationConflictTitle {
    return Intl.message(
      'Installation Conflict',
      name: 'installationConflictTitle',
      desc: '',
      args: [],
    );
  }

  /// `Installation Failed`
  String get installationFailedTitle {
    return Intl.message(
      'Installation Failed',
      name: 'installationFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get invalidPhone {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Log in to continue`
  String get loginToContinue {
    return Intl.message(
      'Log in to continue',
      name: 'loginToContinue',
      desc: '',
      args: [],
    );
  }

  /// `{fieldName} must be at least {min} characters`
  String minLength(Object fieldName, Object min) {
    return Intl.message(
      '$fieldName must be at least $min characters',
      name: 'minLength',
      desc: '',
      args: [fieldName, min],
    );
  }

  /// `Not Now`
  String get notNowButton {
    return Intl.message('Not Now', name: 'notNowButton', desc: '', args: []);
  }

  /// `Open Settings`
  String get openSettingsButton {
    return Intl.message(
      'Open Settings',
      name: 'openSettingsButton',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordField {
    return Intl.message('Password', name: 'passwordField', desc: '', args: []);
  }

  /// `Password must contain: {requirements}`
  String passwordInvalid(Object requirements) {
    return Intl.message(
      'Password must contain: $requirements',
      name: 'passwordInvalid',
      desc: '',
      args: [requirements],
    );
  }

  /// `lowercase letter`
  String get passwordLower {
    return Intl.message(
      'lowercase letter',
      name: 'passwordLower',
      desc: '',
      args: [],
    );
  }

  /// `at least 8 characters`
  String get passwordMin {
    return Intl.message(
      'at least 8 characters',
      name: 'passwordMin',
      desc: '',
      args: [],
    );
  }

  /// `number`
  String get passwordNumber {
    return Intl.message('number', name: 'passwordNumber', desc: '', args: []);
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `special character`
  String get passwordSpecial {
    return Intl.message(
      'special character',
      name: 'passwordSpecial',
      desc: '',
      args: [],
    );
  }

  /// `uppercase letter`
  String get passwordUpper {
    return Intl.message(
      'uppercase letter',
      name: 'passwordUpper',
      desc: '',
      args: [],
    );
  }

  /// `Required permissions denied`
  String get permissionsRequiredMessage {
    return Intl.message(
      'Required permissions denied',
      name: 'permissionsRequiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `Permissions Required`
  String get permissionsRequiredTitle {
    return Intl.message(
      'Permissions Required',
      name: 'permissionsRequiredTitle',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneRequired {
    return Intl.message(
      'Phone number is required',
      name: 'phoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Preparing download...`
  String get preparingDownload {
    return Intl.message(
      'Preparing download...',
      name: 'preparingDownload',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Your study companion`
  String get studyCompanion {
    return Intl.message(
      'Your study companion',
      name: 'studyCompanion',
      desc: '',
      args: [],
    );
  }

  /// `Version {version} is now available!\nCurrent version: {currentVersion}\n\nWould you like to download and install the update now?`
  String updateAvailableMessage(Object version, Object currentVersion) {
    return Intl.message(
      'Version $version is now available!\nCurrent version: $currentVersion\n\nWould you like to download and install the update now?',
      name: 'updateAvailableMessage',
      desc: '',
      args: [version, currentVersion],
    );
  }

  /// `Update Available`
  String get updateAvailableTitle {
    return Intl.message(
      'Update Available',
      name: 'updateAvailableTitle',
      desc: '',
      args: [],
    );
  }

  /// `Error checking for updates`
  String get updateCheckFailedMessage {
    return Intl.message(
      'Error checking for updates',
      name: 'updateCheckFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Update Check Failed`
  String get updateCheckFailedTitle {
    return Intl.message(
      'Update Check Failed',
      name: 'updateCheckFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Error during update`
  String get updateFailedMessage {
    return Intl.message(
      'Error during update',
      name: 'updateFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Update Failed`
  String get updateFailedTitle {
    return Intl.message(
      'Update Failed',
      name: 'updateFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Update Now`
  String get updateNowButton {
    return Intl.message(
      'Update Now',
      name: 'updateNowButton',
      desc: '',
      args: [],
    );
  }

  /// `Nice to see you again!`
  String get welcomeBack {
    return Intl.message(
      'Nice to see you again!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
