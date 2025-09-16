import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/features/movies/presentation/views/movie_detail/movie_detail_view.dart';
import 'package:meu_primeiro_app/features/movies/presentation/views/movie_list/movie_list_state.dart';
import 'movie_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMoviesView extends StatelessWidget {
  const ListMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          // 'state.movies' will always have the current list of movies
          final movies = state.movies;

          return Column(
            children: [
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: movies.length + 1,
                  itemBuilder: (context, index) {
                    if (index < movies.length) {
                      final movie = movies[index];
                      return Card(
                        margin: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: ListTile(
                          title: Text(movie.title),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Don't use setState. Cubit remove.
                              context.read<MovieCubit>().removeMovie(movie);
                            },
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailView(
                                movie: movie,
                              ), // Detail View - ALTERAR AQUI!!
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: FloatingActionButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled:
                                  true, // Permit scrolling if needed
                              builder: (context) {
                                final TextEditingController titleController =
                                    TextEditingController();
                                final TextEditingController yearController =
                                    TextEditingController();
                                final TextEditingController directorController =
                                    TextEditingController();
                                //Formulário para adicionar filme
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SingleChildScrollView(
                                    child: SizedBox(
                                      height: 300, // High
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller: titleController,
                                            decoration: InputDecoration(
                                              labelText: 'Name',
                                            ),
                                          ),
                                          TextField(
                                            controller: yearController,
                                            decoration: InputDecoration(
                                              labelText: 'Year',
                                            ),
                                            keyboardType: TextInputType.number,
                                          ),
                                          TextField(
                                            controller: directorController,
                                            decoration: InputDecoration(
                                              labelText: 'Diretor',
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          ElevatedButton(
                                            onPressed: () {
                                              final title =
                                                  titleController.text;
                                              final year = int.tryParse(
                                                yearController.text,
                                              );
                                              final director =
                                                  directorController.text;

                                              final success = context
                                                  .read<MovieCubit>()
                                                  .onAddMoviePressed(
                                                    title,
                                                    year!, // cant be null!
                                                    director,
                                                  );

                                              if (success) {
                                                Navigator.pop(context);
                                              } else {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) => AlertDialog(
                                                    title: Text('Error'),
                                                    content: Text(
                                                      'Every field must be filled correctly!',
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                              context,
                                                            ),
                                                        child: Text('OK'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                            },
                                            child: Text('Add Movie'),
                                          ),
                                          SizedBox(height: 10),
                                          ElevatedButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text('Cancel'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Icon(Icons.add),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
