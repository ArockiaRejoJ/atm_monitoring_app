import 'package:atm_apk/models/atm_details_model.dart';
import 'package:atm_apk/providers/atm_details_provider.dart';
import 'package:atm_apk/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AtmDetailsModel(),
        ),
        ChangeNotifierProxyProvider<AtmDetailsModel, AtmDetailsProvider>(
          create: (_) => AtmDetailsProvider([]),
          update: (context, auth, previousData) => AtmDetailsProvider(
            previousData == null ? [] : previousData.listOfATMs,
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ATM Monitoring',
          theme: ThemeData(
            primaryColor: Colors.blue[900]!,
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
