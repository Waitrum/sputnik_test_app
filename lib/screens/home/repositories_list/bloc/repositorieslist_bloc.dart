import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sputnik_test_app/models/repos_model.dart';
import 'package:sputnik_test_app/services/api.dart';

part 'repositorieslist_event.dart';
part 'repositorieslist_state.dart';

class RepositorieslistBloc
    extends Bloc<RepositorieslistEvent, RepositorieslistState> {
  RepositorieslistBloc() : super(RepositorieslistLoadingState()) {
    on<RepositorieslistEvent>((event, emit) async {
      var resp = await API().getRepos();

      emit(RepositorieslistSuccessState(resp));
    });
  }
}
