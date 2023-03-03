import 'package:graphql_flutter/graphql_flutter.dart';

  const String rickAndMortyGraphql = r'''
  
  query {
     characters(
         page: 2,
         filter: {
           name: "morty"
         }) {
       info {
         count
       }
       results {
         name
         image
         species
       }
     }
     character(id: 1) {
       id
     }
   }
  
   
   ''';
