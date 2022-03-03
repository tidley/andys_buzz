import 'package:andys_buzz/classes/bolt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Routes
import 'package:andys_buzz/routes/routes.dart';

// Providers
final currentUserProvider = StateProvider((ref) => "guest");
final boltProvider = StateProvider(
  (ref) => [
    {'name': "MyFirstBolt", "location": "home"}
  ],
);
final powerButtonGreen = StateProvider((ref) => [
      BoltTest(id: "0", isLive: false),
      BoltTest(id: "1", isLive: true),
      BoltTest(id: "2", isLive: true),
      BoltTest(id: "3", isLive: true)
    ]);
final powerButtonGreenNotifier =
    StateNotifierProvider<BoltTestNotifier, List<BoltTest>>((ref) {
  return BoltTestNotifier();
});
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
        // '/second': (context) => const SecondScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
