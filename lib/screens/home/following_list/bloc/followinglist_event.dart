part of 'followinglist_bloc.dart';

abstract class FollowinglistEvent extends Equatable {
  const FollowinglistEvent();

  @override
  List<Object> get props => [];
}

class FollowinglistInitialEvent extends FollowinglistEvent {}
