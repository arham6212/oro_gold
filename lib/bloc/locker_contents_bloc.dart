import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oro_gold/service/repository.dart';

import '../models/locker-contents-model.dart';

part 'locker_contents_event.dart';

part 'locker_contents_state.dart';

class LockerContentsBloc
    extends Bloc<LockerContentsEvent, LockerContentsState> {
  final RepoProvider _repositoryProvider = RepoProvider();

  LockerContentsBloc() : super(LockerContentsInitialState()) {
    LockerContentsModel lockerContentsModel;
    on<LockerContentsEvent>((event, emit) async {
      if (event is NavigatedToLockerContentScreenEvent) {
        emit(LockerContentsFetchingState());

        try {
          lockerContentsModel = await _repositoryProvider.fetchLockerContents();
          if (lockerContentsModel.lockerContentsData?.isEmpty == true) {
            emit(LockerContentsEmptyState());
          } else {
            emit(LockerContentsFetchedState(
                lockerContentsModel: lockerContentsModel));
          }
        } catch (e ) {

          emit(LockerContentsErrorState(error:e.toString()));
        }
      }
    });
  }
}
