import 'package:equatable/equatable.dart';
import 'package:meu_primeiro_app/features/movies/movie.dart';

class MovieState extends Equatable {
  // There will always be a List.
  final List<Movie> movies;

  // The list can be empty by default
  const MovieState({this.movies = const []});

  @override
  List<Object> get props => [movies];

  MovieState copyWith({
    List<Movie>?
    movies, // Uses the movie list --> Copy the original to run away from bugs
  }) {
    return MovieState(movies: movies ?? this.movies);
  }
}
