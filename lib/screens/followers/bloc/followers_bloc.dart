import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sputnik_test_app/models/followers_model.dart';
import 'package:sputnik_test_app/services/api.dart';

part 'followers_event.dart';
part 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  FollowersBloc() : super(FollowersLoadingState()) {
    on<FollowersInitializedEvent>((event, emit) async {
      var resp = await API().getFollowers();

      emit(FollowersSuccessState(resp));
    });
    
    on<FollowersRefreshedEvent>((event, emit) async {
      emit(FollowersLoadingState());

      var resp = await API().getFollowers();

      emit(FollowersSuccessState(resp));
    });
  }
}
