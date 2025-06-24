import 'package:flutter/material.dart';

class ClassModel {
  final String title;
  final String subject;
  final String teacher;
  final String description;
  final int studentCount;
  final String lastActivity;
  final String nextCourse;
  final Color iconColor;
  final IconData icon;

  ClassModel({
    required this.title,
    required this.subject,
    required this.teacher,
    required this.description,
    required this.studentCount,
    required this.lastActivity,
    required this.nextCourse,
    required this.iconColor,
    required this.icon,
  });
}
