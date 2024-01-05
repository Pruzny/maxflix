abstract class Constants {
  // API
  static const apiVersion = "3";
  static const baseUrl = "https://api.themoviedb.org/$apiVersion";

  // HTTP
  static const maxRetries = 3;
  static const retryDelay = 1000; // 1 second
  static const httpTimeout = 10000; // 10 seconds
  static const httpUnauthorizedErrorMessage = "Unauthorized access error.";
  static const httpServerErrorMessage = "Server error.";
  static const httpNoConnectionErrorMessage = "No internet connection.";
}
