import 'package:business/pages/qr_reader.dart';
import 'package:business/pages/sample.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Members App',
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // スプラッシュ画面
              return const SizedBox();
            }
            if (snapshot.hasData) {
              // User が null でなない、つまりサインイン済みのホーム画面へ
              return const MyApp();
            }
            // User が null である、つまり未サインインのサインイン画面へ
            return Scaffold(
                appBar: AppBar(title: const Text("ログイン")),
                body: const QrReaderPage());
          },
        ),
      );
}
