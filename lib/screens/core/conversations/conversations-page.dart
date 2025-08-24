import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../../naviagtion/router-map.dart';
import '../../../services/navigationService.dart';
import '../../../services/uiService.dart';
import '../../../theme/theme.dart';

class ConversationsPage extends StatefulWidget {

  const ConversationsPage({super.key});

  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {
  final _uiService = GetIt.I<UiService>();
  final _navService = GetIt.I<NavigationService>();

  @override
  void initState() {
    super.initState();
    _uiService.appBottomNavBarVisibleSignal.set(true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.of(context).col60,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(children: [_Header(), _Conversation()]),
      ),
    );
  }
}

class _Header extends StatelessWidget implements PreferredSizeWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: topPadding, left: 16, right: 16),
      height: preferredSize.height + topPadding,
      color: Colors.grey[900],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
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
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRoute.chat.path);
            },
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.blue, child: Text('U$index')),
              title: Text('User $index'),
              subtitle: Text('Message from user $index'),
              trailing: Text('10:${index % 60}'),
            ),
          );
        },
      ),
    );
  }
}
