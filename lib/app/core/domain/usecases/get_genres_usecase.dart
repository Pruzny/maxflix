import '../models/genre_model.dart';
import '../repositories/genre_repository.dart';

class GetGenresUsecase {
  GetGenresUsecase({
    required GenreRepository genreRepository,
  }) : _genreRepository = genreRepository;

  final GenreRepository _genreRepository;

  Future<List<GenreModel>> call() async {
    return await _genreRepository.getGenres();
  }
}
