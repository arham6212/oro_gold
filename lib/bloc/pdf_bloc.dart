
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oro_gold/models/pdf_data_model.dart';

part 'pdf_event.dart';
part 'pdf_state.dart';

class PdfBloc extends Bloc<PdfEvent, PdfState> {
  PdfBloc() : super(PdfInitialState()) {
    on<PdfLanguageChangEvent>((event, emit) {
      emit(LanguageSuccessfullyChangedState(pdfData: event.pdfData));
    });

  }
}
