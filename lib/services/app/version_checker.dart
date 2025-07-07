import 'package:flutter/material.dart';

import '../../interfaces/app/i_version_checker.dart';

class VersionChecker implements IVersionChecker {
  @override
  bool isVersionOutdated(String current, String latest) {
    try {
      final List<int> currentParts = current.split('.').map(int.parse).toList();
      final List<int> latestParts = latest.split('.').map(int.parse).toList();

      final maxLength = [currentParts.length, latestParts.length]
          .reduce((a, b) => a > b ? a : b);

      while (currentParts.length < maxLength) {
        currentParts.add(0);
      }
      while (latestParts.length < maxLength) {
        latestParts.add(0);
      }

      for (int i = 0; i < maxLength; i++) {
        if (latestParts[i] > currentParts[i]) {
          return true;
        }
        if (latestParts[i] < currentParts[i]) {
          return false;
        }
      }
      return false;
    } on Exception catch (e) {
      debugPrint('Error comparing versions: $e');
      return false;
    }
  }
}
