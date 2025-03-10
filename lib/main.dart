import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/view_model/searchByName.dart';
import 'core/view_model/votingVM.dart';
import 'helper/appRoute.dart';

void main() {
  SearchByNameVM(Dio()).get(name:'SLICED BREAD MULTIGRAIN lusine' );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         locale: const Locale('ar'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
        ],
        debugShowCheckedModeBanner: false,
     // home:AllProductsScreen() ,
      initialRoute: '/allProductionScreen',
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}