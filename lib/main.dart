import 'package:flutter/material.dart';
import 'package:flutter_bestcommerce_dashboard/utils/routs.dart';
import 'package:flutter_bestcommerce_dashboard/utils/theme.dart';
import 'package:flutter_bestcommerce_dashboard/view/home_pager/home_pager.dart';
import 'package:flutter_bestcommerce_dashboard/view_model/home_view_model.dart';
import 'package:flutter_bestcommerce_dashboard/view_model/navigate_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigateViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter-bestcommerce-home-login',
        theme: theme(),
        initialRoute: HomePager.routeName,
        routes: routes,
      ),
    );
  }
}
