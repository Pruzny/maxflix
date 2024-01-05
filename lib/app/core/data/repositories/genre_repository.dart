import '../../constants.dart';
import '../../domain/repositories/genre_repository.dart';
import '../../exceptions/api/unexpected_api_exception.dart';
import '../dtos/genre_dto.dart';
import '../providers/api/genre_provider.dart';

class GenreRepositoryImpl extends GenreRepository {
  GenreRepositoryImpl({
    required genreProvider,
  }) : _genreProvider = genreProvider;

  final GenreProvider _genreProvider;

  @override
  Future<List<GenreDto>> getGenres({
    String language = Constants.defaultLocaleTag,
  }) async {
    final response = await _genreProvider.getGenres(
      language: language,
    );

    if (response["genres"] == null) {
      throw UnexpectedApiException(message: "No genre results");
    }

    final List results = response["genres"];
    final genresAsDto = results
        .map(
          (genre) => GenreDto.fromMap(genre),
        )
        .toList();

    return genresAsDto;
  }
}
