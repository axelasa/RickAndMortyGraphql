import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rick_and_morty_graphql/constants/constants.dart';
@injectable
class GraphQlService {
  late GraphQLClient client;

  GraphQlService(){
    final Link link = httpLink;
    client = GraphQLClient(link: link, cache: GraphQLCache());
  }

  Future<QueryResult>performQuery(String query,
  {required Map<String, dynamic> variables})async{

    QueryOptions options = QueryOptions(variables: variables,document: gql(query));
    final result = await client.query(options);
    return result;
  }

  Future<QueryResult>performMutation(String query,
  {required Map<String, dynamic> variables}) async{
    MutationOptions options =MutationOptions(document: gql(query),variables: variables);
    final result = await client.mutate(options);
    print(result);
    return result;
  }


}