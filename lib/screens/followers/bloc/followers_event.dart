part of 'followers_bloc.dart';

abstract class FollowersEvent extends Equatable {
  const FollowersEvent();

  @override
  List<Object> get props => [];
}

class FollowersInitializedEvent extends FollowersEvent {}
