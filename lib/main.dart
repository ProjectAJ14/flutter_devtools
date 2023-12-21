import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'data/repo/repo.dart';
import 'data/service/service.dart';
import 'features/home/home_screen.dart';
import 'utils/config/server_config.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

void main() => runZonedGuarded(() {
      initService();
      initRepo();

      apiService.init(baseUrl: ServerConfig.baseUrl);

      Bloc.observer = TalkerBlocObserver();

      runApp(const MyApp());
    }, (error, stack) {
      debugPrint("Error: $error");
    });

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
