abstract interface class ITokenManager {
  Future<void> clear();
  Map<String, dynamic> decode(String token);
  Future<void> load();
  Future<void> refreshTken();
  Future<void> save({
    required String accessToken,
    required String refreshToken,
  });
}
