part of 'locker_contents_bloc.dart';

@immutable
abstract class LockerContentsState {}

class LockerContentsInitialState extends LockerContentsState {}
class LockerContentsFetchingState extends LockerContentsState {}
class LockerContentsFetchedState extends LockerContentsState {
   final LockerContentsModel lockerContentsModel;
  LockerContentsFetchedState({required this.lockerContentsModel});
}
class LockerContentsErrorState extends LockerContentsState {
  final String error ;

  LockerContentsErrorState({required this.error});
}
class LockerContentsEmptyState extends LockerContentsState {}
