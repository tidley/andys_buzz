import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Routes
import 'package:andys_buzz/routes/routes.dart';

// Providers
final helloWorldProvider = Provider((ref) => 'Hello worlds');
final balanceProvider = StateProvider((ref) => 13);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Andy's Buzz",
      initialRoute: '/',
      routes: {
        '/': (context) => const AdminHome(),
        // '/second': (context) => const SecondScreen(),
      },
      debugShowCheckedModeBanner: false,
    );    
  }
}
