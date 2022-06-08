part of 'repositorieslist_bloc.dart';

abstract class RepositorieslistEvent extends Equatable {
  const RepositorieslistEvent();

  @override
  List<Object> get props => [];
}

class RepositorieslistInitialEvent extends RepositorieslistEvent {}
