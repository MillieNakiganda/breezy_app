import 'package:breezy_backend_client/breezy_backend_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'package:breezy/core/providers/user_type_provider.dart';
import 'package:breezy/core/server/server_client.dart';
import 'package:breezy/core/utils/router/route_names.dart';

export 'package:breezy_backend_client/breezy_backend_client.dart';

class ServerAuthLogic {
  ServerAuthLogic._();

  static late final Client serverClient;

  static late final String serverUrl;

  static bool get isServerAuthenticated => serverClient.auth.isAuthenticated;

  static Future<void> initializeServerClient() async {
    serverUrl = await getServerUrl();

    serverClient = Client(serverUrl)
      ..connectivityMonitor = FlutterConnectivityMonitor()
      ..authSessionManager = FlutterAuthSessionManager();

    await serverClient.auth.initialize();
  }

  static Future<String> getAuthenticatedHomeRoute() async {
    final authId = serverClient.auth.authInfo?.authUserId;
    if (authId == null) return AppRoutes.loginView;

    final userProfile = await serverClient.userProfileCustom.getUserProfile(
      authId,
    );
    if (userProfile?.id == null) return AppRoutes.clientHome;

    final role = await serverClient.role.getForUserProfile(userProfile!.id!);
    if (role.isNotEmpty && UserType.cleaner.name == role.first.roleName) {
      return AppRoutes.cleanerHome;
    }
    return AppRoutes.clientHome;
  }
}
