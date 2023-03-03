
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_graphql/pages/loading_page.dart';
import 'package:rick_and_morty_graphql/pages/rick_and_morty_block_characters.dart';
import 'package:rick_and_morty_graphql/pages/rick_and_morty_characters.dart';
import 'package:rick_and_morty_graphql/presentation/block/rick_and_morty_block.dart';
import 'package:rick_and_morty_graphql/presentation/block/rick_and_morty_event.dart';
import 'package:rick_and_morty_graphql/utils/rick_and_morty_block_observer.dart';

import 'api/bloc_network_call.dart';

void main() {
  Bloc.observer = RickAndMortyBlocObserver();

 // Route route;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty Demo',
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:BlocProvider<RickAndMortyBlock>(
        create: (BuildContext context) => RickAndMortyBlock()..add(const RickAndMorty(rickAndMortyGraphql)),
        child: const RickAndMortyBlocCharacters(),
      ),
      //   initialRoute: '/',
      // routes: {
      //  // '/':(context) => const Loading(),
      //   '/rick_and_morty_charachters':(context) => const RickAndMortyCharacters(),
      //   '/':(context) => const RickAndMortyBlocCharacters(),
      // },
    );

  }
}
