import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/features/movies/movie.dart';

class MovieDetailView extends StatelessWidget {
  final Movie movie;

  const MovieDetailView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Details')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // deixa o card do tamanho do conteúdo
              children: [
                Text(
                  'Title: ${movie.title}',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text('Year: ${movie.year}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 16),
                Text('Director: ${movie.director}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Main Screen"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
