import 'package:breezy_backend_client/breezy_backend_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

export 'package:breezy_backend_client/breezy_backend_client.dart';

late final Client serverClient;

late final String serverUrl;

bool get isServerAuthenticated => serverClient.auth.isAuthenticated;

Future<void> initializeServerClient() async {
  serverUrl = await getServerUrl();

  serverClient = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = FlutterAuthSessionManager();

  await serverClient.auth.initialize();
}
