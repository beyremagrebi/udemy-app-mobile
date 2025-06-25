abstract interface class ITokenManager {
  Future<void> load();
  Future<void> save();
}
