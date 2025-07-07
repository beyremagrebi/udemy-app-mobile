// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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

  String get localeName => 'ar';

  static String m0(error) => "فشل التحميل: ${error}";

  static String m1(fieldName) => "حقل ${fieldName} مطلوب";

  static String m2(fieldName, min) =>
      "يجب أن يحتوي ${fieldName} على ${min} أحرف على الأقل";

  static String m3(requirements) =>
      "يجب أن تحتوي كلمة المرور على: ${requirements}";

  static String m4(version, currentVersion) =>
      "الإصدار ${version} متاح الآن!\nالإصدار الحالي: ${currentVersion}\n\nهل تريد تحميل وتثبيت التحديث الآن؟";
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("إيروداكسيس"),
        "cancelButton": MessageLookupByLibrary.simpleMessage("إلغاء"),
        "cancelDownloadButton": MessageLookupByLibrary.simpleMessage(
          "إلغاء التحميل",
        ),
        "cancelDownloadMessage": MessageLookupByLibrary.simpleMessage(
          "هل أنت متأكد من أنك تريد إلغاء التحميل؟ يمكنك دائماً التحديث لاحقاً من الإعدادات.",
        ),
        "cancelDownloadTitle": MessageLookupByLibrary.simpleMessage(
          "إلغاء التحميل؟",
        ),
        "closeButton": MessageLookupByLibrary.simpleMessage("إغلاق"),
        "continueDownloadButton": MessageLookupByLibrary.simpleMessage(
          "متابعة التحميل",
        ),
        "downloadAlreadyInProgress": MessageLookupByLibrary.simpleMessage(
          "التحميل قيد التقدم بالفعل",
        ),
        "downloadCancelled": MessageLookupByLibrary.simpleMessage(
          "تم إلغاء التحميل",
        ),
        "downloadComplete":
            MessageLookupByLibrary.simpleMessage("اكتمل التحميل"),
        "downloadCompleteMessage": MessageLookupByLibrary.simpleMessage(
          "تم تحميل التحديث بنجاح. يرجى اتباع مطالبات التثبيت لإكمال التحديث.",
        ),
        "downloadCompleteTitle": MessageLookupByLibrary.simpleMessage(
          "اكتمل التحميل",
        ),
        "downloadCompletedInstalling": MessageLookupByLibrary.simpleMessage(
          "اكتمل التحميل. جاري التثبيت...",
        ),
        "downloadFailedError": m0,
        "downloadFailedTryAgain": MessageLookupByLibrary.simpleMessage(
          "فشل التحميل. يرجى المحاولة مرة أخرى.",
        ),
        "downloadingStatus": MessageLookupByLibrary.simpleMessage(
          "Téléchargement en cours...",
        ),
        "downloadingUpdateTitle": MessageLookupByLibrary.simpleMessage(
          "جاري تحميل التحديث",
        ),
        "emailField": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
        "emailRequired": MessageLookupByLibrary.simpleMessage(
          "البريد الإلكتروني مطلوب",
        ),
        "enterEmail": MessageLookupByLibrary.simpleMessage(
          "أدخل البريد الإلكتروني",
        ),
        "enterPassword":
            MessageLookupByLibrary.simpleMessage("أدخل كلمة المرور"),
        "error": MessageLookupByLibrary.simpleMessage("خطأ"),
        "fieldRequired": m1,
        "forgotPassword": MessageLookupByLibrary.simpleMessage(
          "هل نسيت كلمة المرور؟",
        ),
        "gotItButton": MessageLookupByLibrary.simpleMessage("فهمت"),
        "installationConflictMessage": MessageLookupByLibrary.simpleMessage(
          "لا يمكن تثبيت التحديث بسبب تعارض مع الإصدار الحالي.\n\nيحدث هذا عادة عندما لا تتطابق توقيعات التطبيق.\n\nيرجى إلغاء تثبيت التطبيق الحالي أولاً:\n1. اذهب إلى الإعدادات > التطبيقات\n2. ابحث عن \"erudaxis\" واختره\n3. اضغط على \"إلغاء التثبيت\"\n4. ثم أعد المحاولة للتحديث",
        ),
        "installationConflictTitle": MessageLookupByLibrary.simpleMessage(
          "تعارض في التثبيت",
        ),
        "installationFailedTitle": MessageLookupByLibrary.simpleMessage(
          "فشل التثبيت",
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
        "minLength": m2,
        "notNowButton": MessageLookupByLibrary.simpleMessage("ليس الآن"),
        "openSettingsButton":
            MessageLookupByLibrary.simpleMessage("فتح الإعدادات"),
        "passwordField": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "passwordInvalid": m3,
        "passwordLower": MessageLookupByLibrary.simpleMessage("حرف صغير"),
        "passwordMin": MessageLookupByLibrary.simpleMessage("8 أحرف على الأقل"),
        "passwordNumber": MessageLookupByLibrary.simpleMessage("رقم"),
        "passwordRequired": MessageLookupByLibrary.simpleMessage(
          "كلمة المرور مطلوبة",
        ),
        "passwordSpecial": MessageLookupByLibrary.simpleMessage("رمز خاص"),
        "passwordUpper": MessageLookupByLibrary.simpleMessage("حرف كبير"),
        "permissionsRequiredMessage": MessageLookupByLibrary.simpleMessage(
          "تم رفض الأذونات المطلوبة",
        ),
        "permissionsRequiredTitle": MessageLookupByLibrary.simpleMessage(
          "الأذونات مطلوبة",
        ),
        "phoneRequired":
            MessageLookupByLibrary.simpleMessage("رقم الهاتف مطلوب"),
        "preparingDownload": MessageLookupByLibrary.simpleMessage(
          "Préparation du téléchargement...",
        ),
        "rememberMe": MessageLookupByLibrary.simpleMessage("تذكرني"),
        "studyCompanion": MessageLookupByLibrary.simpleMessage("رفيق دراستك"),
        "updateAvailableMessage": m4,
        "updateAvailableTitle":
            MessageLookupByLibrary.simpleMessage("تحديث متاح"),
        "updateCheckFailedMessage": MessageLookupByLibrary.simpleMessage(
          "خطأ في فحص التحديثات",
        ),
        "updateCheckFailedTitle": MessageLookupByLibrary.simpleMessage(
          "فشل في فحص التحديث",
        ),
        "updateFailedMessage": MessageLookupByLibrary.simpleMessage(
          "خطأ أثناء التحديث",
        ),
        "updateFailedTitle":
            MessageLookupByLibrary.simpleMessage("فشل التحديث"),
        "updateNowButton": MessageLookupByLibrary.simpleMessage("تحديث الآن"),
        "welcomeBack":
            MessageLookupByLibrary.simpleMessage("سعداء برؤيتك مجددًا!"),
      };
}
