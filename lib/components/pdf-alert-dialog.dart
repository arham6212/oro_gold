import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:oro_gold/bloc/pdf_bloc.dart';
import 'package:oro_gold/components/vertical_spacing.dart';
import 'package:oro_gold/models/pdf_data_model.dart';
import 'package:oro_gold/service/repository.dart';

import '../common/app_images.dart';
import '../themes/app_colors.dart';
import '../utils/tools.dart';
import 'common_button.dart';

class PdfAlertDialog extends StatelessWidget {
  final _repositoryProvider = RepoProvider();

  PdfAlertDialog({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PdfBloc, PdfState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          content: SizedBox(
            height: Tools.getDeviceHeight(context) * 0.8,
            width: Tools.getDeviceWidth(context) * 0.99,
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: Tools.downloadFile(
                        state is LanguageSuccessfullyChangedState? state.pdfData.url:(state is PdfInitialState? 'https://www.orimi.com/pdf-test.pdf':'')),
                    builder: (context, AsyncSnapshot<File> snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : snapshot.hasData
                                ? PDFView(
                                    filePath: snapshot.data?.path,
                                    autoSpacing: false,
                                    enableSwipe: true,
                                    pageSnap: true,
                                    pageFling: false,
                                  )
                                : const Offstage(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: Tools.isTablet(context)?60:16),
                          alignment: Alignment.center,
                          height: Tools.isTablet(context)?55:36,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: AppColors.inactiveText)),
                          child:  Text(
                            'Close',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: Tools.isTablet(context)?22:14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CommonButton(
                          text: 'Confirm to Proceed Further',
                          callback: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpacing(height: 24)
              ],
            ),
          ),
          titlePadding: const EdgeInsets.all(24),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('e-Kyc Confirmation', style: TextStyle(fontSize: Tools.isTablet(context)?20:14),),
              const Spacer(),
              FutureBuilder(
                  future: _repositoryProvider.fetchPdfDataContent(),
                  builder: (context, AsyncSnapshot<PdfDataModel> snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : snapshot.hasData
                              ? PopupMenuButton(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: AppColors.mediumYellow,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(( state
                                        is LanguageSuccessfullyChangedState
                                            ? state.pdfData.language
                                            :
                                          snapshot.data?.pdfData?.first
                                                  .language )??'',
                                          style: TextStyle(
                                              fontSize: Tools.isTablet(context)?22:10,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(width: 4),
                                        Image.asset(
                                          AppImages.gTranslateIcon,
                                        ),
                                      ],
                                    ),
                                  ),
                                  itemBuilder: (_) {
                                    return snapshot.data!.pdfData!
                                        .map((PdfData? choice) {
                                      return PopupMenuItem(
                                        value: choice,
                                        child: Text(choice?.language ?? ''),
                                      );
                                    }).toList();
                                  },
                                  onSelected: (PdfData selectedValue) {
                                    BlocProvider.of<PdfBloc>(context).add(PdfLanguageChangEvent(pdfData: selectedValue));
                                  },
                                )
                              : const Offstage()),
            ],
          ),
        );
      },
    );
  }
}
