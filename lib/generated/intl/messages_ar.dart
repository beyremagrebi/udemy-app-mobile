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

  static String m0(error) => "فشل التحميل: ${error}";

  static String m1(fieldName) => "حقل ${fieldName} مطلوب";

  static String m2(fieldName, min) =>
      "يجب أن يحتوي ${fieldName} على ${min} أحرف على الأقل";

  static String m3(requirements) =>
      "يجب أن تحتوي كلمة المرور على: ${requirements}";

  static String m4(version, currentVersion) =>
      "الإصدار ${version} متاح الآن!\nالإصدار الحالي: ${currentVersion}\n\nهل تريد تحميل وتثبيت التحديث الآن؟";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about_title": MessageLookupByLibrary.simpleMessage("حول"),
    "access_classes_groups": MessageLookupByLibrary.simpleMessage(
      "الوصول إلى فصولك ومجموعاتك",
    ),
    "access_educational_content": MessageLookupByLibrary.simpleMessage(
      "الوصول إلى المحتوى التعليمي",
    ),
    "appName": MessageLookupByLibrary.simpleMessage("إيروداكسيس"),
    "appearance_subtitle": MessageLookupByLibrary.simpleMessage(
      "السمة والتخصيص",
    ),
    "appearance_title": MessageLookupByLibrary.simpleMessage("المظهر"),
    "assignments_due": MessageLookupByLibrary.simpleMessage(
      "الواجبات المستحقة",
    ),
    "bonjour": MessageLookupByLibrary.simpleMessage("مرحبا"),
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
    "chat": MessageLookupByLibrary.simpleMessage("المحادثة"),
    "chats_discussions": MessageLookupByLibrary.simpleMessage(
      "الدردشات والمناقشات",
    ),
    "class_position": MessageLookupByLibrary.simpleMessage("الترتيب في الفصل"),
    "closeButton": MessageLookupByLibrary.simpleMessage("إغلاق"),
    "continueDownloadButton": MessageLookupByLibrary.simpleMessage(
      "متابعة التحميل",
    ),
    "courses": MessageLookupByLibrary.simpleMessage("الدروس"),
    "courses_this_week": MessageLookupByLibrary.simpleMessage(
      "الدروس هذا الأسبوع",
    ),
    "dailyTracking": MessageLookupByLibrary.simpleMessage("المتابعة اليومية"),
    "dashboard": MessageLookupByLibrary.simpleMessage("لوحة التحكم"),
    "downloadAlreadyInProgress": MessageLookupByLibrary.simpleMessage(
      "التحميل قيد التقدم بالفعل",
    ),
    "downloadCancelled": MessageLookupByLibrary.simpleMessage(
      "تم إلغاء التحميل",
    ),
    "downloadComplete": MessageLookupByLibrary.simpleMessage("اكتمل التحميل"),
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
      "جاري التحميل...",
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
    "enterPassword": MessageLookupByLibrary.simpleMessage("أدخل كلمة المرور"),
    "error": MessageLookupByLibrary.simpleMessage("خطأ"),
    "fieldRequired": m1,
    "forgotPassword": MessageLookupByLibrary.simpleMessage(
      "هل نسيت كلمة المرور؟",
    ),
    "general": MessageLookupByLibrary.simpleMessage("عام"),
    "gotItButton": MessageLookupByLibrary.simpleMessage("فهمت"),
    "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
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
    "language_title": MessageLookupByLibrary.simpleMessage("اللغة"),
    "loading": MessageLookupByLibrary.simpleMessage("جارٍ التحميل..."),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "loginToContinue": MessageLookupByLibrary.simpleMessage(
      "سجّل الدخول للمتابعة",
    ),
    "logout_subtitle": MessageLookupByLibrary.simpleMessage("إغلاق الجلسة"),
    "logout_title": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
    "messaging": MessageLookupByLibrary.simpleMessage("المراسلة"),
    "minLength": m2,
    "my_classes": MessageLookupByLibrary.simpleMessage("فصولي"),
    "my_courses": MessageLookupByLibrary.simpleMessage("دوراتي"),
    "notNowButton": MessageLookupByLibrary.simpleMessage("ليس الآن"),
    "notification_subtitle": MessageLookupByLibrary.simpleMessage(
      "إعدادات الإشعارات",
    ),
    "notification_title": MessageLookupByLibrary.simpleMessage("الإشعارات"),
    "openSettingsButton": MessageLookupByLibrary.simpleMessage("فتح الإعدادات"),
    "overall_average": MessageLookupByLibrary.simpleMessage("المعدل العام"),
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
    "pendingInvoices": MessageLookupByLibrary.simpleMessage("الفواتير المعلقة"),
    "permissionsRequiredMessage": MessageLookupByLibrary.simpleMessage(
      "تم رفض الأذونات المطلوبة",
    ),
    "permissionsRequiredTitle": MessageLookupByLibrary.simpleMessage(
      "الأذونات مطلوبة",
    ),
    "phoneRequired": MessageLookupByLibrary.simpleMessage("رقم الهاتف مطلوب"),
    "planning": MessageLookupByLibrary.simpleMessage("الجدول"),
    "preparingDownload": MessageLookupByLibrary.simpleMessage(
      "جاري تحضير التحميل...",
    ),
    "privacy_subtitle": MessageLookupByLibrary.simpleMessage(
      "الأمان والخصوصية",
    ),
    "privacy_title": MessageLookupByLibrary.simpleMessage("الخصوصية"),
    "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "profile_subtitle": MessageLookupByLibrary.simpleMessage(
      "إدارة معلوماتك الشخصية",
    ),
    "profile_title": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "quickActions": MessageLookupByLibrary.simpleMessage("الإجراءات السريعة"),
    "quick_settings_title": MessageLookupByLibrary.simpleMessage(
      "الإعدادات السريعة",
    ),
    "quizzesToDo": MessageLookupByLibrary.simpleMessage("الاختبارات المطلوبة"),
    "recentLibrary": MessageLookupByLibrary.simpleMessage("المكتبة الحديثة"),
    "rememberMe": MessageLookupByLibrary.simpleMessage("تذكرني"),
    "schedule": MessageLookupByLibrary.simpleMessage("جدول المواعيد"),
    "settings_title": MessageLookupByLibrary.simpleMessage("الإعدادات"),
    "statistics": MessageLookupByLibrary.simpleMessage("الإحصائيات"),
    "studyCompanion": MessageLookupByLibrary.simpleMessage("رفيق دراستك"),
    "support_subtitle": MessageLookupByLibrary.simpleMessage(
      "الأسئلة الشائعة والمساعدة",
    ),
    "support_title": MessageLookupByLibrary.simpleMessage("مساعدة ودعم"),
    "unread_messages": MessageLookupByLibrary.simpleMessage(
      "الرسائل غير المقروءة",
    ),
    "upcomingEvents": MessageLookupByLibrary.simpleMessage("الأحداث القادمة"),
    "upcomingSessions": MessageLookupByLibrary.simpleMessage("الجلسات القادمة"),
    "updateAvailableMessage": m4,
    "updateAvailableTitle": MessageLookupByLibrary.simpleMessage("تحديث متاح"),
    "updateCheckFailedMessage": MessageLookupByLibrary.simpleMessage(
      "خطأ في فحص التحديثات",
    ),
    "updateCheckFailedTitle": MessageLookupByLibrary.simpleMessage(
      "فشل في فحص التحديث",
    ),
    "updateFailedMessage": MessageLookupByLibrary.simpleMessage(
      "خطأ أثناء التحديث",
    ),
    "updateFailedTitle": MessageLookupByLibrary.simpleMessage("فشل التحديث"),
    "updateNowButton": MessageLookupByLibrary.simpleMessage("تحديث الآن"),
    "view_timetable": MessageLookupByLibrary.simpleMessage(
      "استشر جدولك الزمني",
    ),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("سعداء برؤيتك مجددًا!"),
    "yourRank": MessageLookupByLibrary.simpleMessage("ترتيبك"),
  };
}
