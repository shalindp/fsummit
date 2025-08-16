import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ConversationsPage"),
            ElevatedButton(
              onPressed: () {
                context.push('/chat');
              },
              child: Text("Go to chat"),
            ),
          ],
        ),
      ),
    );
  }
}
