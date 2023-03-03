

import 'package:graphql_flutter/graphql_flutter.dart';

 Future<dynamic> apiCall()async{

   const String rickAndMortyGraphql = '''
   query {
     characters(
         page: 2,
         filter: {
           name: "rick"
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

   try{
     final HttpLink httpLink = HttpLink("https://rick-and-morty-graphql.p.rapidapi.com/?rapidapi-key=df426960bdmshb77732c5ec5eccbp17be25jsncbdb6e024755");

     GraphQLClient client = GraphQLClient(link: httpLink,cache: GraphQLCache(store: InMemoryStore()),);

     QueryOptions options = QueryOptions(document: gql(rickAndMortyGraphql));

     QueryResult result = await client.query(options);


     if(result.hasException){
       print('Error ${result.exception.toString()}');
     }
     if(result.isLoading){
       print("loading");
     }

     final data = result.data!['characters'];
      print("HERE IS THE CLIENT $data");
     
     return data;
   }
   catch(e){
     print(e.toString());
     return;
   }
}