class ApiConstants {
  static const String baseUrl = 'https://safety.runasp.net/api';

  // Authentication Endpoints
  static const String login = '/Authentication/Login';
  static const String clientRegister = '/Authentication/Register';
  static const String confirmEmail = '/Authentication/Confirm-Email';
  static const String refreshToken = '/Authentication/Refresh-Token';
  static const String forgotPassword = '/Authentication/Forgot-Password';
  static const String resetPassword = '/Authentication/Reset-Password';
  static const String addProblem = '/Problem';
}
