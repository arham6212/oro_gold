part of 'pdf_bloc.dart';

@immutable
abstract class PdfState {}

class PdfInitialState extends PdfState {}
class LanguageSuccessfullyChangedState extends PdfState{
  final PdfData pdfData ;

  LanguageSuccessfullyChangedState({required this.pdfData});
}
class PdfDataFetchedState extends PdfState{
  final PdfData pdfData ;

  PdfDataFetchedState({required this.pdfData});
}
