enum FacilityType {
  trainingCenter('centreDeFormation', 'training-company'),
  lycee('lycee', 'lycee'),
  college('college', 'college');

  final String databaseValue;
  final String endpoint;

  const FacilityType(this.databaseValue, this.endpoint);

  static FacilityType? fromBackendValue(String? value) {
    switch (value) {
      case 'centreDeFormation':
        return FacilityType.trainingCenter;
      case 'lycee':
        return FacilityType.lycee;
      case 'college':
        return FacilityType.college;
    }
    return null;
  }
}
