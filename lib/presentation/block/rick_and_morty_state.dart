
import 'package:equatable/equatable.dart';

class RickAndMortyState extends Equatable{
  const RickAndMortyState();

  @override
  List<Object?> get props => [];
}

class RickAndMortyInitialLoading extends RickAndMortyState{
  const RickAndMortyInitialLoading(): super();
}
class RickAndMortyLoading extends RickAndMortyState{
  const RickAndMortyLoading():super();
}

class RickAndMortyLoadDataSuccess extends RickAndMortyState{
  final dynamic data;

  const RickAndMortyLoadDataSuccess(this.data):super();

  @override
  List<Object> get props =>[data];
}

class RickAndMortyLoadDataFailed extends RickAndMortyState{
  final dynamic error;

  const RickAndMortyLoadDataFailed(this.error):super();

  @override
  List<Object> get props => [error];
}