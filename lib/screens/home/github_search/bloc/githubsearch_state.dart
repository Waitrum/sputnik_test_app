part of 'githubsearch_bloc.dart';

abstract class GithubsearchState extends Equatable {
  const GithubsearchState();

  @override
  List<Object> get props => [];
}

class GithubsearchSearchState extends GithubsearchState {
  final String text;

  const GithubsearchSearchState([this.text = '']);
  
  @override
  List<Object> get props => [text];
}

class GithubsearchErrorState extends GithubsearchState {}
