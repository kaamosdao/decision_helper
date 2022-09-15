import 'package:decision_helper/bloc/decision_bloc.dart';
import 'package:flutter/material.dart';
import 'package:decision_helper/UI/screens/add_cons_screen.dart';
import 'package:decision_helper/UI/screens/add_decision_screen.dart';
import 'package:decision_helper/UI/screens/add_pros_screen.dart';
import 'package:decision_helper/UI/screens/result_screen.dart';
import 'package:decision_helper/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DecisionBloc>(
      create: (context) => DecisionBloc(),
      child: MaterialApp(
        title: 'Decision Helper',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Catamaran',
        ),
        routes: {
          AppRoutes.decision: (context) => const AddDecisionScreen(),
          AppRoutes.pros: (context) => const AddProsScreen(),
          AppRoutes.cons: (context) => const AddConsScreen(),
          AppRoutes.result: (context) => const ResultScreen(),
        },
        initialRoute: AppRoutes.decision,
        home: const AddProsScreen(),
      ),
    );
  }
}
