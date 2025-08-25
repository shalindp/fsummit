import 'package:fsummit/screens/auth-page.dart';
import 'package:fsummit/screens/core/_layout.dart';
import 'package:fsummit/screens/core/conversations/chat-page.dart';
import 'package:fsummit/screens/core/profile/settings-page.dart';
import 'package:go_router/go_router.dart';

import '../screens/core/conversations/conversations-page.dart';
import '../screens/core/discover/discover-page.dart';
import '../screens/core/match/match-page.dart';

enum AppRoute {
  auth("/auth"),
  discover("/"),
  match("/match"),
  conversations("/conversations", subPaths: ["/chat"]),
  chat("/chat"),
  profile("/profile");

  final String path;
  final List<String> subPaths;

  const AppRoute(this.path, {this.subPaths = const []});
}

final GoRouter appRouterMap = GoRouter(
  initialLocation: AppRoute.discover.path,
  routes: [
    GoRoute(
      path: AppRoute.auth.path,
      builder: (context, state) {
        return const AuthPage();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => CoreTabLayout(navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.discover.path,
              builder: (context, state) {
                return const DiscoverPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.match.path,
              builder: (context, state) {
                return const MatchPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.conversations.path,
              builder: (context, state) {
                return const ConversationsPage();
              },
            ),
            GoRoute(
              path: AppRoute.chat.path,
              builder: (context, state) {
                return const ChatPage();
              },
            ),
            GoRoute(
              path: "/dog",
              builder: (context, state) {
                return ChatPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.profile.path,
              builder: (context, state) {
                return const ProfilePage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

void x(){
}