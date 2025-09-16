// THIS IS THE MAIN SCREEN OF THE APPLICATION!!
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meu_primeiro_app/features/movies/presentation/views/movie_list/movie_list_cubit.dart';
import 'package:meu_primeiro_app/features/movies/presentation/views/movie_list/movie_list_view.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp x BlocProvider.
    // Creates the MovieCubit once and provides it to all child widgets.
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: MaterialApp(
        title: 'Felipe Davila Mendes - Movie Center',
        home: MyFirstScreen(),
      ),
    );
  }
}

class MyFirstScreen extends StatefulWidget {
  const MyFirstScreen({super.key});

  @override
  State<MyFirstScreen> createState() => _MyFirstScreenState();
}

class _MyFirstScreenState extends State<MyFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Felipe Davila Mendes - Movie Center'),

        actions: [],
        backgroundColor: Colors.green, // Bar Color
      ),

      body: ListMoviesView(), // BODY OF THE APP
    );
  }
}
