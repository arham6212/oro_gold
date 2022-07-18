import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oro_gold/bloc/locker_contents_bloc.dart';
import 'package:oro_gold/bloc/pdf_bloc.dart';
import 'package:oro_gold/common/routes.dart';

import 'bloc/payment_tles_bloc.dart';
import 'themes/app_colors.dart';

void main() async {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LockerContentsBloc()),
        BlocProvider(create: (_) => PaymentTileBloc()),
        BlocProvider(create: (_) => PdfBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Oro Safe',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors.backGroundColor,
              foregroundColor: Colors.black,
              elevation: 0),
          textTheme:
              GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme)
                  .copyWith(
            bodyText1: GoogleFonts.oswald(
                textStyle: Theme.of(context).textTheme.bodyText1),
          ),
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}
