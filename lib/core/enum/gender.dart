enum Gender { men, women, other }

extension GenderExtension on Gender {
  String get displayName {
    switch (this) {
      case Gender.men:
        return 'Men';
      case Gender.women:
        return 'Women';
      case Gender.other:
        return 'Other';
    }
  }

  String get frenchDisplayName {
    switch (this) {
      case Gender.men:
        return 'Homme';
      case Gender.women:
        return 'Femme';
      case Gender.other:
        return 'Autre';
    }
  }

  String toBackendValue() {
    switch (this) {
      case Gender.men:
        return 'homme';
      case Gender.women:
        return 'femme';
      case Gender.other:
        return 'autre';
    }
  }

  static Gender? fromBackendValue(String? value) {
    if (value == null) {
      return null;
    }

    switch (value.toLowerCase()) {
      case 'homme':
        return Gender.men;
      case 'femme':
        return Gender.women;
      case 'autre':
        return Gender.other;
      default:
        return null;
    }
  }
}
