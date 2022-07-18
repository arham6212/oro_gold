part of 'payment_tles_bloc.dart';

@immutable
abstract class PaymentTileState {}

class PaymentTileInitialState extends PaymentTileState {}

class InformationLoadedState extends PaymentTileState {
  final ChoosePlanData planModel;
  final int index, value ;

  InformationLoadedState({required this.index, required this.value, required this.planModel});
}

class InformationErrorState extends PaymentTileState {
  final String error;

  InformationErrorState({required this.error});
}
