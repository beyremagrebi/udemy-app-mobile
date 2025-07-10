extension MapExtension on Map<String, Object> {
  void add(String key, Object? value) {
    if (value != null) {
      this[key] = value;
    }
  }
}
