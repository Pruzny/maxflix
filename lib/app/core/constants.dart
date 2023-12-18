// API
const apiVersion = "3";
const baseUrl = "https://api.themoviedb.org/$apiVersion";

// HTTP
const maxRetries = 3;
const retryDelay = 1000; // 1 second
const httpTimeout = 10000; // 10 seconds
const httpUnauthorizedErrorMessage = "Unauthorized access error.";
const httpServerErrorMessage = "Server error.";
const httpNoConnectionErrorMessage = "No internet connection.";
