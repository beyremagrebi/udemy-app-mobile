abstract interface class ITokenManager {
  Future<void> load();
  Future<void> save(
      {required String accessToken, required String refreshToken});
}
