part of 'pdf_bloc.dart';

@immutable
abstract class PdfEvent {}
class PdfLanguageChangEvent extends PdfEvent{
  final PdfData pdfData ;

  PdfLanguageChangEvent({required this.pdfData});
}