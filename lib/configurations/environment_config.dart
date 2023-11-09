class EnvironmentConfig {
  static const String profile = String.fromEnvironment('profile', defaultValue: "dev");
  static const String googleXApiKeyAndroid = String.fromEnvironment('GOOGLE_X_API_KEY_ANDROID');
  static const String googleXApiKeyIOS = String.fromEnvironment('GOOGLE_X_API_KEY_IOS');
  static const isLoggingEnable = bool.fromEnvironment('LOGGING_HTTP_ENABLE');
}
