import '../constants/constant.dart';

enum Role {
  superAdmin,
  companyAdmin,
  collaborator,
  instructor,
  responsable,
  student;

  const Role();

  String localizedName() {
    switch (this) {
      case Role.superAdmin:
        return intl.role_super_admin;
      case Role.companyAdmin:
        return intl.role_company_admin;
      case Role.collaborator:
        return intl.role_collaborator;
      case Role.instructor:
        return intl.role_instructor;
      case Role.responsable:
        return intl.role_responsable;
      case Role.student:
        return intl.role_student;
    }
  }
}

extension RoleExtension on Role {
  String toBackendValue() {
    switch (this) {
      case Role.superAdmin:
        return 'super-admin';
      case Role.companyAdmin:
        return 'company-admin';
      case Role.collaborator:
        return 'utilisateur';
      case Role.instructor:
        return 'instructor';
      case Role.responsable:
        return 'responsable';
      case Role.student:
        return 'student';
    }
  }

  static Role? fromBackendValue(String? value) {
    switch (value) {
      case 'super-admin':
        return Role.superAdmin;
      case 'company-admin':
        return Role.companyAdmin;
      case 'utilisateur':
        return Role.collaborator;
      case 'instructor':
        return Role.instructor;
      case 'responsable':
        return Role.instructor;
      case 'student':
        return Role.student;
    }
    return null;
  }
}
