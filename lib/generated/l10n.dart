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

  /// `About`
  String get about_title {
    return Intl.message('About', name: 'about_title', desc: '', args: []);
  }

  /// `Absences`
  String get absences {
    return Intl.message('Absences', name: 'absences', desc: '', args: []);
  }

  /// `Access your classes and groups`
  String get access_classes_groups {
    return Intl.message(
      'Access your classes and groups',
      name: 'access_classes_groups',
      desc: '',
      args: [],
    );
  }

  /// `Access educational content`
  String get access_educational_content {
    return Intl.message(
      'Access educational content',
      name: 'access_educational_content',
      desc: '',
      args: [],
    );
  }

  /// `ACTIVE`
  String get active_chip {
    return Intl.message('ACTIVE', name: 'active_chip', desc: '', args: []);
  }

  /// `Active Theme`
  String get active_theme_label {
    return Intl.message(
      'Active Theme',
      name: 'active_theme_label',
      desc: '',
      args: [],
    );
  }

  /// `Amber Gold`
  String get amber_gold {
    return Intl.message('Amber Gold', name: 'amber_gold', desc: '', args: []);
  }

  /// `Theme and customization`
  String get appearance_subtitle {
    return Intl.message(
      'Theme and customization',
      name: 'appearance_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance_title {
    return Intl.message(
      'Appearance',
      name: 'appearance_title',
      desc: '',
      args: [],
    );
  }

  /// `Erudaxis`
  String get appName {
    return Intl.message('Erudaxis', name: 'appName', desc: '', args: []);
  }

  /// `Aqua Marine`
  String get aqua_marine {
    return Intl.message('Aqua Marine', name: 'aqua_marine', desc: '', args: []);
  }

  /// `Assignments due`
  String get assignments_due {
    return Intl.message(
      'Assignments due',
      name: 'assignments_due',
      desc: '',
      args: [],
    );
  }

  /// `Birth Date`
  String get birth_date {
    return Intl.message('Birth Date', name: 'birth_date', desc: '', args: []);
  }

  /// `Hello`
  String get bonjour {
    return Intl.message('Hello', name: 'bonjour', desc: '', args: []);
  }

  /// `Burgundy`
  String get burgundy {
    return Intl.message('Burgundy', name: 'burgundy', desc: '', args: []);
  }

  /// `Calendar`
  String get calendar {
    return Intl.message('Calendar', name: 'calendar', desc: '', args: []);
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

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Charcoal`
  String get charcoal {
    return Intl.message('Charcoal', name: 'charcoal', desc: '', args: []);
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `Chats and discussions`
  String get chats_discussions {
    return Intl.message(
      'Chats and discussions',
      name: 'chats_discussions',
      desc: '',
      args: [],
    );
  }

  /// `Chocolate Brown`
  String get chocolate_brown {
    return Intl.message(
      'Chocolate Brown',
      name: 'chocolate_brown',
      desc: '',
      args: [],
    );
  }

  /// `Class Rank`
  String get class_position {
    return Intl.message(
      'Class Rank',
      name: 'class_position',
      desc: '',
      args: [],
    );
  }

  /// `Class`
  String get classe {
    return Intl.message('Class', name: 'classe', desc: '', args: []);
  }

  /// `Classes`
  String get classes {
    return Intl.message('Classes', name: 'classes', desc: '', args: []);
  }

  /// `Close`
  String get closeButton {
    return Intl.message('Close', name: 'closeButton', desc: '', args: []);
  }

  /// `Confirm New Password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New Password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Login Activity`
  String get connection_activity {
    return Intl.message(
      'Login Activity',
      name: 'connection_activity',
      desc: '',
      args: [],
    );
  }

  /// `Manage connected devices and history.`
  String get connection_activity_description {
    return Intl.message(
      'Manage connected devices and history.',
      name: 'connection_activity_description',
      desc: '',
      args: [],
    );
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

  /// `Copper Bronze`
  String get copper_bronze {
    return Intl.message(
      'Copper Bronze',
      name: 'copper_bronze',
      desc: '',
      args: [],
    );
  }

  /// `Coral Pink`
  String get coral_pink {
    return Intl.message('Coral Pink', name: 'coral_pink', desc: '', args: []);
  }

  /// `Cours`
  String get courses {
    return Intl.message('Cours', name: 'courses', desc: '', args: []);
  }

  /// `Courses this week`
  String get courses_this_week {
    return Intl.message(
      'Courses this week',
      name: 'courses_this_week',
      desc: '',
      args: [],
    );
  }

  /// `Crimson Red`
  String get crimson_red {
    return Intl.message('Crimson Red', name: 'crimson_red', desc: '', args: []);
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `Daily Tracking`
  String get dailyTracking {
    return Intl.message(
      'Daily Tracking',
      name: 'dailyTracking',
      desc: '',
      args: [],
    );
  }

  /// `Dark Teal`
  String get dark_teal {
    return Intl.message('Dark Teal', name: 'dark_teal', desc: '', args: []);
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `Deep Maroon`
  String get deep_maroon {
    return Intl.message('Deep Maroon', name: 'deep_maroon', desc: '', args: []);
  }

  /// `Default`
  String get default_theme {
    return Intl.message('Default', name: 'default_theme', desc: '', args: []);
  }

  /// `Documents`
  String get documents {
    return Intl.message('Documents', name: 'documents', desc: '', args: []);
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

  /// `Electric Blue`
  String get electric_blue {
    return Intl.message(
      'Electric Blue',
      name: 'electric_blue',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email_address {
    return Intl.message(
      'Email Address',
      name: 'email_address',
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

  /// `Emerald Green`
  String get emerald_green {
    return Intl.message(
      'Emerald Green',
      name: 'emerald_green',
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

  /// `Exams`
  String get exams {
    return Intl.message('Exams', name: 'exams', desc: '', args: []);
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

  /// `Fields do not match`
  String get fields_do_not_match {
    return Intl.message(
      'Fields do not match',
      name: 'fields_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message('First Name', name: 'first_name', desc: '', args: []);
  }

  /// `Forest Green`
  String get forest_green {
    return Intl.message(
      'Forest Green',
      name: 'forest_green',
      desc: '',
      args: [],
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

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Golden Brown`
  String get golden_brown {
    return Intl.message(
      'Golden Brown',
      name: 'golden_brown',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get gotItButton {
    return Intl.message('Got it', name: 'gotItButton', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Hot Pink`
  String get hot_pink {
    return Intl.message('Hot Pink', name: 'hot_pink', desc: '', args: []);
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

  /// `Institution`
  String get institution {
    return Intl.message('Institution', name: 'institution', desc: '', args: []);
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

  /// `Invoices`
  String get invoices {
    return Intl.message('Invoices', name: 'invoices', desc: '', args: []);
  }

  /// `Language`
  String get language_title {
    return Intl.message('Language', name: 'language_title', desc: '', args: []);
  }

  /// `Arabic`
  String get languageArabic {
    return Intl.message('Arabic', name: 'languageArabic', desc: '', args: []);
  }

  /// `English`
  String get languageEnglish {
    return Intl.message('English', name: 'languageEnglish', desc: '', args: []);
  }

  /// `French`
  String get languageFrench {
    return Intl.message('French', name: 'languageFrench', desc: '', args: []);
  }

  /// `Last Name`
  String get last_name {
    return Intl.message('Last Name', name: 'last_name', desc: '', args: []);
  }

  /// `Lavender`
  String get lavender {
    return Intl.message('Lavender', name: 'lavender', desc: '', args: []);
  }

  /// `Library`
  String get library {
    return Intl.message('Library', name: 'library', desc: '', args: []);
  }

  /// `Lime Green`
  String get lime_green {
    return Intl.message('Lime Green', name: 'lime_green', desc: '', args: []);
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

  /// `Close session`
  String get logout_subtitle {
    return Intl.message(
      'Close session',
      name: 'logout_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout_title {
    return Intl.message('Log out', name: 'logout_title', desc: '', args: []);
  }

  /// `Magenta`
  String get magenta {
    return Intl.message('Magenta', name: 'magenta', desc: '', args: []);
  }

  /// `Messaging`
  String get messaging {
    return Intl.message('Messaging', name: 'messaging', desc: '', args: []);
  }

  /// `Midnight Blue`
  String get midnight_blue {
    return Intl.message(
      'Midnight Blue',
      name: 'midnight_blue',
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

  /// `Mint Green`
  String get mint_green {
    return Intl.message('Mint Green', name: 'mint_green', desc: '', args: []);
  }

  /// `My Classes`
  String get my_classes {
    return Intl.message('My Classes', name: 'my_classes', desc: '', args: []);
  }

  /// `My Courses`
  String get my_courses {
    return Intl.message('My Courses', name: 'my_courses', desc: '', args: []);
  }

  /// `Navy Blue`
  String get navy_blue {
    return Intl.message('Navy Blue', name: 'navy_blue', desc: '', args: []);
  }

  /// `Neon Green`
  String get neon_green {
    return Intl.message('Neon Green', name: 'neon_green', desc: '', args: []);
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Notification settings`
  String get notification_subtitle {
    return Intl.message(
      'Notification settings',
      name: 'notification_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification_title {
    return Intl.message(
      'Notifications',
      name: 'notification_title',
      desc: '',
      args: [],
    );
  }

  /// `Not Now`
  String get notNowButton {
    return Intl.message('Not Now', name: 'notNowButton', desc: '', args: []);
  }

  /// `required`
  String get obligatoire {
    return Intl.message('required', name: 'obligatoire', desc: '', args: []);
  }

  /// `Ocean Blue`
  String get ocean_blue {
    return Intl.message('Ocean Blue', name: 'ocean_blue', desc: '', args: []);
  }

  /// `Olive Green`
  String get olive_green {
    return Intl.message('Olive Green', name: 'olive_green', desc: '', args: []);
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

  /// `Overall average`
  String get overall_average {
    return Intl.message(
      'Overall average',
      name: 'overall_average',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get password_changed_success {
    return Intl.message(
      'Password changed successfully',
      name: 'password_changed_success',
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

  /// `Pending Invoices`
  String get pendingInvoices {
    return Intl.message(
      'Pending Invoices',
      name: 'pendingInvoices',
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

  /// `Personal Information`
  String get personal_info {
    return Intl.message(
      'Personal Information',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
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

  /// `Planning`
  String get planning {
    return Intl.message('Planning', name: 'planning', desc: '', args: []);
  }

  /// `Plum Purple`
  String get plum_purple {
    return Intl.message('Plum Purple', name: 'plum_purple', desc: '', args: []);
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

  /// `Primary & Secondary`
  String get primary_secondary {
    return Intl.message(
      'Primary & Secondary',
      name: 'primary_secondary',
      desc: '',
      args: [],
    );
  }

  /// `Security and privacy`
  String get privacy_subtitle {
    return Intl.message(
      'Security and privacy',
      name: 'privacy_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy_title {
    return Intl.message('Privacy', name: 'privacy_title', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Manage your personal info`
  String get profile_subtitle {
    return Intl.message(
      'Manage your personal info',
      name: 'profile_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_title {
    return Intl.message('Profile', name: 'profile_title', desc: '', args: []);
  }

  /// `Quick Settings`
  String get quick_settings_title {
    return Intl.message(
      'Quick Settings',
      name: 'quick_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Quick Actions`
  String get quickActions {
    return Intl.message(
      'Quick Actions',
      name: 'quickActions',
      desc: '',
      args: [],
    );
  }

  /// `Quizzes`
  String get quizzes {
    return Intl.message('Quizzes', name: 'quizzes', desc: '', args: []);
  }

  /// `Quizzes to Do`
  String get quizzesToDo {
    return Intl.message(
      'Quizzes to Do',
      name: 'quizzesToDo',
      desc: '',
      args: [],
    );
  }

  /// `Recent Library`
  String get recentLibrary {
    return Intl.message(
      'Recent Library',
      name: 'recentLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Required`
  String get required {
    return Intl.message('Required', name: 'required', desc: '', args: []);
  }

  /// `Rose Pink`
  String get rose_pink {
    return Intl.message('Rose Pink', name: 'rose_pink', desc: '', args: []);
  }

  /// `Royal Blue`
  String get royal_blue {
    return Intl.message('Royal Blue', name: 'royal_blue', desc: '', args: []);
  }

  /// `Royal Purple`
  String get royal_purple {
    return Intl.message(
      'Royal Purple',
      name: 'royal_purple',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Schedule`
  String get schedule {
    return Intl.message('Schedule', name: 'schedule', desc: '', args: []);
  }

  /// `School Information`
  String get school_info {
    return Intl.message(
      'School Information',
      name: 'school_info',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get seeMore {
    return Intl.message('See more', name: 'seeMore', desc: '', args: []);
  }

  /// `Settings`
  String get settings_title {
    return Intl.message('Settings', name: 'settings_title', desc: '', args: []);
  }

  /// `Sky Blue`
  String get sky_blue {
    return Intl.message('Sky Blue', name: 'sky_blue', desc: '', args: []);
  }

  /// `Slate Gray`
  String get slate_gray {
    return Intl.message('Slate Gray', name: 'slate_gray', desc: '', args: []);
  }

  /// `Statistics`
  String get statistics {
    return Intl.message('Statistics', name: 'statistics', desc: '', args: []);
  }

  /// `Steel Blue`
  String get steel_blue {
    return Intl.message('Steel Blue', name: 'steel_blue', desc: '', args: []);
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

  /// `Subjects`
  String get subjects {
    return Intl.message('Subjects', name: 'subjects', desc: '', args: []);
  }

  /// `Sunset Orange`
  String get sunset_orange {
    return Intl.message(
      'Sunset Orange',
      name: 'sunset_orange',
      desc: '',
      args: [],
    );
  }

  /// `FAQ & assistance`
  String get support_subtitle {
    return Intl.message(
      'FAQ & assistance',
      name: 'support_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get support_title {
    return Intl.message(
      'Help & Support',
      name: 'support_title',
      desc: '',
      args: [],
    );
  }

  /// `Tangerine`
  String get tangerine {
    return Intl.message('Tangerine', name: 'tangerine', desc: '', args: []);
  }

  /// `Turquoise`
  String get turquoise {
    return Intl.message('Turquoise', name: 'turquoise', desc: '', args: []);
  }

  /// `Unread messages`
  String get unread_messages {
    return Intl.message(
      'Unread messages',
      name: 'unread_messages',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Events`
  String get upcomingEvents {
    return Intl.message(
      'Upcoming Events',
      name: 'upcomingEvents',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Sessions`
  String get upcomingSessions {
    return Intl.message(
      'Upcoming Sessions',
      name: 'upcomingSessions',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get update_profile {
    return Intl.message(
      'Update Profile',
      name: 'update_profile',
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

  /// `Video Conference`
  String get videoConference {
    return Intl.message(
      'Video Conference',
      name: 'videoConference',
      desc: '',
      args: [],
    );
  }

  /// `View login activity`
  String get view_connection_activity {
    return Intl.message(
      'View login activity',
      name: 'view_connection_activity',
      desc: '',
      args: [],
    );
  }

  /// `View your timetable`
  String get view_timetable {
    return Intl.message(
      'View your timetable',
      name: 'view_timetable',
      desc: '',
      args: [],
    );
  }

  /// `Violet Purple`
  String get violet_purple {
    return Intl.message(
      'Violet Purple',
      name: 'violet_purple',
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

  /// `Your Rank`
  String get yourRank {
    return Intl.message('Your Rank', name: 'yourRank', desc: '', args: []);
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
