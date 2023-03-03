
import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_graphql/presentation/block/rick_and_morty_event.dart';
import 'package:rick_and_morty_graphql/presentation/block/rick_and_morty_state.dart';
import '../../data/remote/graphql_service.dart';

class RickAndMortyBlock extends Bloc<RickAndMortyEvent,RickAndMortyState> {

  late GraphQlService service;

  RickAndMortyBlock() : super ( const RickAndMortyInitialLoading()){
    service = GraphQlService();
    on<RickAndMorty>(mapFetchDataToState);
  }

  RickAndMortyState get initialState => const RickAndMortyLoading();

  mapFetchDataToState(RickAndMorty event,Emitter<RickAndMortyState> emit,) async{
    final query = event.query;
    final Map<String,dynamic>? variables;
  variables = event.variables;

  try{
    emit(const RickAndMortyLoading());
    final result = await service.performMutation(query, variables: variables ?? {});
    if(result.hasException){
      if(result.exception!.linkException is ServerException){
        ServerException exception =  result.exception!.linkException as ServerException;
  var errorMessage = exception.parsedResponse?.errors?[0].message;
   print(errorMessage);
   emit(RickAndMortyLoadDataFailed(errorMessage.toString()));
  }else{
  var reason = result.exception?.graphqlErrors[0].extensions?['reason'];
  print('loading : reason: $reason');
  // String validationerrors = '';
  // Map validation =
  // result.exception?.graphqlErrors[0].extensions?['validation'] ??
  // {};
  }
  }else{
  emit(RickAndMortyLoadDataSuccess(result.data));
  }
  }catch(e){
    print(e);
    emit(RickAndMortyLoadDataFailed(e.toString()));
  }
  }
}