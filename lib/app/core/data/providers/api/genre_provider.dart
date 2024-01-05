import '../../../adapters/http_adapter.dart';
import '../../../constants.dart';
import '../../../env/env.dart';
import '../../../exceptions/api/no_api_response_exception.dart';
import '../../../exceptions/api/unexpected_api_exception.dart';
import '../base_provider.dart';

class GenreProvider extends BaseProvider {
  GenreProvider({
    required Http http,
  }) : _http = http;

  final Http _http;

  /// Get genres from movie database.
  ///
  /// `GET` `/genre/movie/list`
  ///
  /// ### Authenticated
  /// `true`
  ///
  /// ### Path Variables
  /// `none`
  ///
  /// ### Request Parameters
  /// + `api_key` API key.
  /// + `language` Language used in results.
  ///
  /// ### Request body
  /// `none`
  ///
  /// ### Responses
  /// `200`
  /// ```json
  /// {
  ///  "genres": [
  ///   {
  ///   "id": integer,
  ///  "name": string
  /// }
  /// ]
  /// }
  /// ```
  Future<Map<String, dynamic>> getGenres({
    String language = Constants.defaultLocaleTag,
  }) async {
    try {
      final response = await _http.get(
        "/genre/movie/list",
        headers: {
          "Authorization": "Bearer ${Env.apiKey}",
        },
        query: {
          "api_key": Env.apiKey,
          "language": language,
        },
      );

      validateResponse(
        response: response,
        statusCodes: [200],
      );

      return response.data;
    } on NoApiResponseException {
      rethrow;
    } catch (e) {
      logError(e.toString());
      throw UnexpectedApiException();
    }
  }
}
