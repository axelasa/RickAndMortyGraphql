import 'package:equatable/equatable.dart';

abstract class RickAndMortyEvent extends Equatable{
  const RickAndMortyEvent();

  @override
  List<Object> get props => [];
}

class RickAndMorty extends RickAndMortyEvent {
  final String query;
  final Map<String,dynamic>? variables;

  const RickAndMorty( this.query, {this.variables}): super();

  @override
  List<Object> get props =>[query,variables ?? {}];
}