import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Routes
import 'package:andys_buzz/routes/routes.dart';

// Providers
final helloWorldProvider = Provider((_) => 'Hello world');

final balanceProvider = Provider((_)=>[0]);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Text(value),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );    
  }
}