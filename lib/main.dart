import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/screens/screens.dart';

import 'core/config/env_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig.init();
  runApp(const ProviderScope(child: AiAssistantApp()));
}

class AiAssistantApp extends StatelessWidget {
  const AiAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistente Financeiro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00d9ff),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
      ),
      home: const AnalysisScreen(),
    );
  }
}
