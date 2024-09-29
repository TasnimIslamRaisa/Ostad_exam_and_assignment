import 'package:flutter/material.dart';
import 'package:test_project_with_firebase/live_score_application/ui/screens/match_list_screen.dart';
class LiveScoreApp extends StatelessWidget {
  const LiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MatchListScreen(),
    );
  }
}