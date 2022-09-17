mixin TokenContainer {
  static String? _token;
  static String? get token => _token;

  static void updateToken(String? token) {
    _token = token;
  }
}
