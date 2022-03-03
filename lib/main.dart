import 'package:andys_buzz/classes/bolt.dart';
import 'package:andys_buzz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Routes
import 'package:andys_buzz/routes/routes.dart';

// Providers
final currentUserProvider = StateProvider((ref) => "guest");
final boltProvider = StateProvider(
  (ref) => [
    Bolt(name: "a", location: "1"),
    Bolt(name: "b", location: "2", isPowered: true),
    Bolt(name: "c", location: "3"),
    Bolt(name: "d", location: "4")
  ],
);
final boltClassProvider =
    ChangeNotifierProvider((ref) => Bolt(name: "a", location: "1"));
final helloWorldProvider = Provider((ref) => 'Hello worlds');
final balanceProvider = StateProvider((ref) => 13);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Andy's Buzz",
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/adminHome': (context) => const AdminHome(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
