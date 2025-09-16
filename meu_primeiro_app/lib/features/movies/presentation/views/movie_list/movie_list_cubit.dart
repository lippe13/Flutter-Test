import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meu_primeiro_app/features/movies/movie.dart';
import 'movie_list_state.dart';

class MovieCubit extends Cubit<MovieState> {
  // Initial state with some movies
  MovieCubit()
    : super(
        MovieState(
          movies: [
            Movie(title: 'The Conjuring 4', year: 2025, director: 'James Wan'),
            Movie(
              title: 'Avengers: End Game',
              year: 2019,
              director: 'Russo Brothers',
            ),
            Movie(
              title: 'Interstellar',
              year: 2014,
              director: 'Christopher Nolan',
            ),
          ],
        ),
      );

  // Function to add a new movie
  void addMovie(String title, int year, String director) {
    final newMovie = Movie(title: title, year: year, director: director);
    final updatedList = List<Movie>.from(state.movies)..add(newMovie);
    emit(state.copyWith(movies: updatedList));
  }

  // Onpressd function to add a new movie with validation
  bool onAddMoviePressed(String title, int year, String director) {
    final ano = int.tryParse(year.toString());
    if (title.isEmpty || ano == null || director.isEmpty) {
      return false;
    }

    final newMovie = Movie(title: title, year: year, director: director);
    final updatedList = List<Movie>.from(state.movies)..add(newMovie);

    emit(state.copyWith(movies: updatedList));

    return true;
  }

  // Function to remove a movie
  void removeMovie(Movie movieToRemove) {
    final updatedList = List<Movie>.from(state.movies)..remove(movieToRemove);

    emit(state.copyWith(movies: updatedList));
  }
}
