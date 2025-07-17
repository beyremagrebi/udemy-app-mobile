import 'package:erudaxis/core/constants/constant.dart';
import 'package:flutter/material.dart';

enum DrawerItem {
  home('Home', icon: Icons.dashboard, color: Colors.greenAccent),
  classes(
    'Classes',
    icon: Icons.school,
    color: Colors.blue,
  ),
  subjects(
    'Matières',
    icon: Icons.menu_book,
    color: Colors.green,
  ),
  exams(
    'Examens',
    icon: Icons.assignment,
    color: Colors.red,
  ),
  quizzes(
    'Quiz',
    icon: Icons.quiz,
    color: Colors.purple,
  ),
  library(
    'Bibliothèque',
    icon: Icons.library_books,
    color: Colors.brown,
  ),
  documents(
    'Documents',
    icon: Icons.description,
    color: Colors.blueGrey,
  ),
  invoices(
    'Factures',
    icon: Icons.receipt,
    color: Colors.orange,
  ),
  absences(
    'Absences',
    icon: Icons.person_off,
    color: Colors.deepOrange,
  ),
  schedule(
    'Emploi du temps',
    icon: Icons.schedule,
    color: Colors.teal,
  ),
  calendar(
    'Calendrier',
    icon: Icons.calendar_today,
    color: Colors.indigo,
  ),
  videoConference(
    'Vidéo-Conférence',
    icon: Icons.videocam,
    color: Colors.deepPurple,
  ),
  settings(
    'Paramètres',
    icon: Icons.settings,
    color: Colors.grey,
  ),
  logout(
    'Se déconnecter',
    icon: Icons.logout,
    color: Colors.red,
  );

  final String displayName;
  final IconData icon;
  final Color color;

  const DrawerItem(
    this.displayName, {
    required this.icon,
    required this.color,
  });

  String localizedName() {
    switch (this) {
      case DrawerItem.home:
        return intl.home;
      case DrawerItem.classes:
        return intl.classes;
      case DrawerItem.subjects:
        return intl.subjects;
      case DrawerItem.exams:
        return intl.exams;
      case DrawerItem.quizzes:
        return intl.quizzes;
      case DrawerItem.library:
        return intl.library;
      case DrawerItem.documents:
        return intl.documents;
      case DrawerItem.invoices:
        return intl.invoices;
      case DrawerItem.absences:
        return intl.absences;
      case DrawerItem.schedule:
        return intl.schedule;
      case DrawerItem.calendar:
        return intl.calendar;
      case DrawerItem.videoConference:
        return intl.videoConference;
      case DrawerItem.settings:
        return intl.settings_title;
      case DrawerItem.logout:
        return intl.logout_title;
    }
  }
}
