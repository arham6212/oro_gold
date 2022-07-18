import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oro_gold/models/choose_plan_model.dart';

part 'payment_tile_event.dart';

part 'payment_tile_state.dart';

class PaymentTileBloc
    extends Bloc<PaymentTileTapEvent, PaymentTileState> {
  PaymentTileBloc() : super(PaymentTileInitialState()) {
    on<PaymentTileTappedEvent>((event, emit) {
      try {
        emit(InformationLoadedState(planModel: event.paymentModel, value: event.value, index: event.index));
      } catch (e) {
        emit(InformationErrorState(error: e.toString()));
      }
    });
  }
}
