import 'package:flutter/material.dart';

void main() async {
  runApp(const IAMPortalApp());
}

class IAMPortalApp extends StatelessWidget {
  const IAMPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IAM Portal",
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const Placeholder(),
        '/overview': (context) => const Placeholder(),
      },
    );
  }
}
