import '../../constants.dart';
import '../models/movie_preview_model.dart';
import '../repositories/movie_repository.dart';

class GetMoviesByNameUsecase {
  GetMoviesByNameUsecase({
    required MovieRepository repository,
  }) : _repository = repository;

  final MovieRepository _repository;

  Future<List<MoviePreviewModel>> call({
    int page = 1,
    language = Constants.defaultLocaleTag,
    required String query,
  }) async {
    return await _repository.getMoviesByName(
      page: page,
      language: language,
      query: query,
    );
  }
}
