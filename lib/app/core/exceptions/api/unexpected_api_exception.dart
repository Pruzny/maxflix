class UnexpectedApiException implements Exception {
  UnexpectedApiException({
    this.message = "Unexpected error with API communication.",
  });

  final String message;

  @override
  String toString() => message;
}
