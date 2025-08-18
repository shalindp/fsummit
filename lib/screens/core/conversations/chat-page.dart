import 'package:flutter/material.dart';
import 'package:fsummit/theme/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).col60,
      body: Padding(
        padding: const EdgeInsets.only(top: 56.0),
        child: Column(children: [_Header(), _Conversation()]),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      height: 60,
      child: Row(
        spacing: 10,
        children: [
          Text("<", style: TextStyle(color: Colors.white, fontSize: 16)),
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kavya',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Active 40m ago', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class _Conversation extends StatelessWidget {
  const _Conversation({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 500,
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(backgroundColor: Colors.blue, child: Text('U$index')),
            title: Text('User $index'),
            subtitle: Text('Message from user $index'),
            trailing: Text('10:${index % 60}'),
          );
        },
      ),
    );
  }
}
