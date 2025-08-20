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
    "about_title": MessageLookupByLibrary.simpleMessage("À propos"),
    "absences": MessageLookupByLibrary.simpleMessage("Absences"),
    "access_classes_groups": MessageLookupByLibrary.simpleMessage(
      "Accéder à vos classes et groupes",
    ),
    "access_educational_content": MessageLookupByLibrary.simpleMessage(
      "Accéder aux contenus pédagogiques",
    ),
    "active_chip": MessageLookupByLibrary.simpleMessage("ACTIF"),
    "active_theme_label": MessageLookupByLibrary.simpleMessage("Thème actif"),
    "all": MessageLookupByLibrary.simpleMessage("Toutes"),
    "amber_gold": MessageLookupByLibrary.simpleMessage("Or ambré"),
    "appName": MessageLookupByLibrary.simpleMessage("Erudaxis"),
    "appearance_subtitle": MessageLookupByLibrary.simpleMessage(
      "Theme et personalisé",
    ),
    "appearance_title": MessageLookupByLibrary.simpleMessage("Apparence"),
    "aqua_marine": MessageLookupByLibrary.simpleMessage("Aigue-marine"),
    "assignments_due": MessageLookupByLibrary.simpleMessage("Devoirs à rendre"),
    "attendance_call": MessageLookupByLibrary.simpleMessage("Appel"),
    "birth_date": MessageLookupByLibrary.simpleMessage("Date de naissance"),
    "bonjour": MessageLookupByLibrary.simpleMessage("Bonjour"),
    "burgundy": MessageLookupByLibrary.simpleMessage("Bordeaux"),
    "calendar": MessageLookupByLibrary.simpleMessage("Calendrier"),
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
    "change_password": MessageLookupByLibrary.simpleMessage(
      "Changer le mot de passe",
    ),
    "charcoal": MessageLookupByLibrary.simpleMessage("Charbon"),
    "chat": MessageLookupByLibrary.simpleMessage("Discussion"),
    "chats_discussions": MessageLookupByLibrary.simpleMessage(
      "Chats et discussions",
    ),
    "chocolate_brown": MessageLookupByLibrary.simpleMessage("Brun chocolat"),
    "choose_your_institution": MessageLookupByLibrary.simpleMessage(
      "Choisissez votre établissement",
    ),
    "class_position": MessageLookupByLibrary.simpleMessage(
      "Position en classe",
    ),
    "classe": MessageLookupByLibrary.simpleMessage("Classe"),
    "classes": MessageLookupByLibrary.simpleMessage("Classes"),
    "closeButton": MessageLookupByLibrary.simpleMessage("Fermer"),
    "college": MessageLookupByLibrary.simpleMessage("Collège"),
    "confirm_new_password": MessageLookupByLibrary.simpleMessage(
      "Confirmer le nouveau mot de passe",
    ),
    "connection_activity": MessageLookupByLibrary.simpleMessage(
      "Activité de connexion",
    ),
    "connection_activity_description": MessageLookupByLibrary.simpleMessage(
      "Gérer les appareils connectés et l‘historique.",
    ),
    "continueDownloadButton": MessageLookupByLibrary.simpleMessage(
      "Continuer le téléchargement",
    ),
    "copper_bronze": MessageLookupByLibrary.simpleMessage("Bronze cuivré"),
    "coral_pink": MessageLookupByLibrary.simpleMessage("Rose corail"),
    "courses": MessageLookupByLibrary.simpleMessage("Cours"),
    "courses_this_week": MessageLookupByLibrary.simpleMessage(
      "Cours cette semaine",
    ),
    "crimson_red": MessageLookupByLibrary.simpleMessage("Rouge cramoisi"),
    "current_password": MessageLookupByLibrary.simpleMessage(
      "Mot de passe actuel",
    ),
    "dailyTracking": MessageLookupByLibrary.simpleMessage("Suivi Journalier"),
    "dark_teal": MessageLookupByLibrary.simpleMessage("Sarcelle foncée"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Tableau de Bord"),
    "deep_maroon": MessageLookupByLibrary.simpleMessage("Bordeaux foncé"),
    "default_theme": MessageLookupByLibrary.simpleMessage("Par défaut"),
    "documents": MessageLookupByLibrary.simpleMessage("Documents"),
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
      "La mise à jour a été téléchargée avec succès. Veuillez suivre les invites d‘installation pour terminer la mise à jour.",
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
    "downloadingStatus": MessageLookupByLibrary.simpleMessage(
      "Téléchargement en cours...",
    ),
    "downloadingUpdateTitle": MessageLookupByLibrary.simpleMessage(
      "Téléchargement de la mise à jour",
    ),
    "electric_blue": MessageLookupByLibrary.simpleMessage("Bleu électrique"),
    "emailField": MessageLookupByLibrary.simpleMessage("E-mail"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "L‘adresse e-mail est requise",
    ),
    "email_address": MessageLookupByLibrary.simpleMessage("Adresse email"),
    "emerald_green": MessageLookupByLibrary.simpleMessage("Vert émeraude"),
    "enterEmail": MessageLookupByLibrary.simpleMessage("Entrez votre email"),
    "enterPassword": MessageLookupByLibrary.simpleMessage(
      "Entrez votre mot de passe",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Erreur"),
    "establishment": MessageLookupByLibrary.simpleMessage("Établissement"),
    "exams": MessageLookupByLibrary.simpleMessage("Examens"),
    "fieldRequired": m1,
    "fields_do_not_match": MessageLookupByLibrary.simpleMessage(
      "Les champs ne correspondent pas",
    ),
    "first_name": MessageLookupByLibrary.simpleMessage("Prénom"),
    "forest_green": MessageLookupByLibrary.simpleMessage("Vert forêt"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage(
      "Mot de passe oublié ?",
    ),
    "general": MessageLookupByLibrary.simpleMessage("Général"),
    "golden_brown": MessageLookupByLibrary.simpleMessage("Brun doré"),
    "gotItButton": MessageLookupByLibrary.simpleMessage("Compris"),
    "home": MessageLookupByLibrary.simpleMessage("Accueil"),
    "hot_pink": MessageLookupByLibrary.simpleMessage("Rose vif"),
    "installationConflictMessage": MessageLookupByLibrary.simpleMessage(
      "La mise à jour ne peut pas être installée car elle entre en conflit avec la version actuelle.\n\nCela se produit généralement lorsque les signatures d‘application ne correspondent pas.\n\nVeuillez d‘abord désinstaller l‘application actuelle :\n1. Allez dans Paramètres > Applications\n2. Trouvez et sélectionnez \"erudaxis\"\n3. Appuyez sur \"Désinstaller\"\n4. Puis réessayez la mise à jour",
    ),
    "installationConflictTitle": MessageLookupByLibrary.simpleMessage(
      "Conflit d‘installation",
    ),
    "installationFailedTitle": MessageLookupByLibrary.simpleMessage(
      "Échec de l‘installation",
    ),
    "institution": MessageLookupByLibrary.simpleMessage("Établissement"),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer une adresse e-mail valide",
    ),
    "invalidPhone": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer un numéro de téléphone valide",
    ),
    "invoices": MessageLookupByLibrary.simpleMessage("Factures"),
    "languageArabic": MessageLookupByLibrary.simpleMessage("Arabe"),
    "languageEnglish": MessageLookupByLibrary.simpleMessage("Anglais"),
    "languageFrench": MessageLookupByLibrary.simpleMessage("Français"),
    "language_title": MessageLookupByLibrary.simpleMessage("Language"),
    "last_name": MessageLookupByLibrary.simpleMessage("Nom"),
    "lavender": MessageLookupByLibrary.simpleMessage("Lavande"),
    "library": MessageLookupByLibrary.simpleMessage("Bibliothèque"),
    "lime_green": MessageLookupByLibrary.simpleMessage("Vert citron"),
    "loading": MessageLookupByLibrary.simpleMessage("Chargement..."),
    "login": MessageLookupByLibrary.simpleMessage("Se connecter"),
    "loginToContinue": MessageLookupByLibrary.simpleMessage(
      "Connectez-vous pour continuer",
    ),
    "logout_subtitle": MessageLookupByLibrary.simpleMessage(
      "Fermer las session",
    ),
    "logout_title": MessageLookupByLibrary.simpleMessage("Se déconnecter"),
    "lycee": MessageLookupByLibrary.simpleMessage("Lycée"),
    "magenta": MessageLookupByLibrary.simpleMessage("Magenta"),
    "members": MessageLookupByLibrary.simpleMessage("Membres"),
    "messages": MessageLookupByLibrary.simpleMessage("Messages"),
    "messaging": MessageLookupByLibrary.simpleMessage("Messagerie"),
    "midnight_blue": MessageLookupByLibrary.simpleMessage("Bleu minuit"),
    "minLength": m2,
    "mint_green": MessageLookupByLibrary.simpleMessage("Vert menthe"),
    "my_classes": MessageLookupByLibrary.simpleMessage("Mes Classes"),
    "my_courses": MessageLookupByLibrary.simpleMessage("Mes Cours"),
    "navy_blue": MessageLookupByLibrary.simpleMessage("Bleu marine"),
    "neon_green": MessageLookupByLibrary.simpleMessage("Vert néon"),
    "new_password": MessageLookupByLibrary.simpleMessage(
      "Nouveau mot de passe",
    ),
    "no_data_available": MessageLookupByLibrary.simpleMessage(
      "Aucune donnée disponible",
    ),
    "notNowButton": MessageLookupByLibrary.simpleMessage("Pas maintenant"),
    "notification_subtitle": MessageLookupByLibrary.simpleMessage(
      "Paramètre des notifcations",
    ),
    "notification_title": MessageLookupByLibrary.simpleMessage("Notification"),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "obligatoire": MessageLookupByLibrary.simpleMessage("obligatoire"),
    "ocean_blue": MessageLookupByLibrary.simpleMessage("Bleu océan"),
    "olive_green": MessageLookupByLibrary.simpleMessage("Vert olive"),
    "openSettingsButton": MessageLookupByLibrary.simpleMessage(
      "Ouvrir les paramètres",
    ),
    "overall_average": MessageLookupByLibrary.simpleMessage("Moyenne générale"),
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
    "password_changed_success": MessageLookupByLibrary.simpleMessage(
      "Mot de passe modifié avec succès",
    ),
    "pendingInvoices": MessageLookupByLibrary.simpleMessage(
      "Factures en Attente",
    ),
    "permissionsRequiredMessage": MessageLookupByLibrary.simpleMessage(
      "Autorisations requises refusées",
    ),
    "permissionsRequiredTitle": MessageLookupByLibrary.simpleMessage(
      "Autorisations requises",
    ),
    "personal_info": MessageLookupByLibrary.simpleMessage(
      "Informations Personnelles",
    ),
    "phoneRequired": MessageLookupByLibrary.simpleMessage(
      "Le numéro de téléphone est requis",
    ),
    "phone_number": MessageLookupByLibrary.simpleMessage("Numéro de Téléphone"),
    "planning": MessageLookupByLibrary.simpleMessage("Planning"),
    "plum_purple": MessageLookupByLibrary.simpleMessage("Violet prune"),
    "preparingDownload": MessageLookupByLibrary.simpleMessage(
      "Préparation du téléchargement...",
    ),
    "primary_secondary": MessageLookupByLibrary.simpleMessage(
      "Principal & Secondaire",
    ),
    "privacy_subtitle": MessageLookupByLibrary.simpleMessage(
      "sécurité et confidentialité",
    ),
    "privacy_title": MessageLookupByLibrary.simpleMessage("Confidentialié"),
    "profile": MessageLookupByLibrary.simpleMessage("Profil"),
    "profile_subtitle": MessageLookupByLibrary.simpleMessage(
      "Géere vos information personnel",
    ),
    "profile_title": MessageLookupByLibrary.simpleMessage("Profil"),
    "quickActions": MessageLookupByLibrary.simpleMessage("Actions Rapides"),
    "quick_settings_title": MessageLookupByLibrary.simpleMessage(
      "Paramètre Rapide",
    ),
    "quizzes": MessageLookupByLibrary.simpleMessage("Quiz"),
    "quizzesToDo": MessageLookupByLibrary.simpleMessage("Quiz à Faire"),
    "recentLibrary": MessageLookupByLibrary.simpleMessage(
      "Bibliothèque Récente",
    ),
    "recent_activity": MessageLookupByLibrary.simpleMessage("Activité récente"),
    "refresh": MessageLookupByLibrary.simpleMessage("Rafraîchir"),
    "rememberMe": MessageLookupByLibrary.simpleMessage("Se souvenir de moi"),
    "required": MessageLookupByLibrary.simpleMessage("Obligatoire"),
    "role_collaborator": MessageLookupByLibrary.simpleMessage("Collaborateur"),
    "role_company_admin": MessageLookupByLibrary.simpleMessage(
      "Administrateur d‘entreprise",
    ),
    "role_instructor": MessageLookupByLibrary.simpleMessage("Formateur"),
    "role_responsable": MessageLookupByLibrary.simpleMessage("Responsable"),
    "role_student": MessageLookupByLibrary.simpleMessage("Étudiant"),
    "role_super_admin": MessageLookupByLibrary.simpleMessage(
      "Super Administrateur",
    ),
    "rose_pink": MessageLookupByLibrary.simpleMessage("Rose clair"),
    "royal_blue": MessageLookupByLibrary.simpleMessage("Bleu royal"),
    "royal_purple": MessageLookupByLibrary.simpleMessage("Violet royal"),
    "save": MessageLookupByLibrary.simpleMessage("Sauvegarder"),
    "schedule": MessageLookupByLibrary.simpleMessage("Emploi du temps"),
    "school_info": MessageLookupByLibrary.simpleMessage(
      "Informations Scolaires",
    ),
    "seeMore": MessageLookupByLibrary.simpleMessage("Voir plus"),
    "settings_title": MessageLookupByLibrary.simpleMessage("Paramètre"),
    "sky_blue": MessageLookupByLibrary.simpleMessage("Bleu ciel"),
    "slate_gray": MessageLookupByLibrary.simpleMessage("Gris ardoise"),
    "sombre": MessageLookupByLibrary.simpleMessage("Sombre"),
    "son": MessageLookupByLibrary.simpleMessage("Son"),
    "statistics": MessageLookupByLibrary.simpleMessage("Statistiques"),
    "steel_blue": MessageLookupByLibrary.simpleMessage("Bleu acier"),
    "studyCompanion": MessageLookupByLibrary.simpleMessage(
      "Votre compagnon d‘études",
    ),
    "subject_quote": MessageLookupByLibrary.simpleMessage(
      "Si tout ce que j‘ai fait échouait - ce qui n‘est pas le cas, je pense que cela réussit en fait.",
    ),
    "subjects": MessageLookupByLibrary.simpleMessage("Matières"),
    "sunset_orange": MessageLookupByLibrary.simpleMessage(
      "Orange coucher de soleil",
    ),
    "support_subtitle": MessageLookupByLibrary.simpleMessage(
      "FAQ  & assistance",
    ),
    "support_title": MessageLookupByLibrary.simpleMessage("Aide & Support"),
    "tangerine": MessageLookupByLibrary.simpleMessage("Mandarine"),
    "trainingCenter": MessageLookupByLibrary.simpleMessage(
      "Centre de formation",
    ),
    "turquoise": MessageLookupByLibrary.simpleMessage("Turquoise"),
    "unread": MessageLookupByLibrary.simpleMessage("Non lues"),
    "unread_messages": MessageLookupByLibrary.simpleMessage("Messages non lus"),
    "upcomingEvents": MessageLookupByLibrary.simpleMessage(
      "Événements Prochains",
    ),
    "upcomingSessions": MessageLookupByLibrary.simpleMessage(
      "Prochaines Séances",
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
    "update_profile": MessageLookupByLibrary.simpleMessage(
      "Mettre à jour le profil",
    ),
    "videoConference": MessageLookupByLibrary.simpleMessage("Vidéo-Conférence"),
    "view_connection_activity": MessageLookupByLibrary.simpleMessage(
      "Voir l‘activité de la connexion",
    ),
    "view_timetable": MessageLookupByLibrary.simpleMessage(
      "Consulter votre planning",
    ),
    "violet_purple": MessageLookupByLibrary.simpleMessage("Violet clair"),
    "welcomeBack": MessageLookupByLibrary.simpleMessage(
      "Content de vous revoir !",
    ),
    "yourRank": MessageLookupByLibrary.simpleMessage("Votre Rang"),
  };
}
