import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id = DateTime.now().millisecondsSinceEpoch; // Unique ID
  final String title;
  final int year;
  final String director;

  Movie({required this.title, required this.year, required this.director});

  @override
  // Equatable uses this to compare values and not memory references.
  List<Object?> get props => [id, title, year, director];
}
