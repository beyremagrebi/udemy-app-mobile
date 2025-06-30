enum ApiStatus {
  success,
  loading,
  error;

  bool get isCompleted => this == ApiStatus.success;

  bool get isError => this == ApiStatus.error;

  bool get isLoading => this == ApiStatus.loading;
}
