part of 'payment_tles_bloc.dart';

@immutable
abstract class PaymentTileTapEvent {}


class PaymentTileTappedEvent extends PaymentTileTapEvent{
  final ChoosePlanData paymentModel  ;
  final int index, value;

  PaymentTileTappedEvent({required this.index,required  this.value, required this.paymentModel });
}
