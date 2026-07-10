import 'package:breezy/core/providers/user_type_provider.dart';
import 'package:breezy/core/server/server_client.dart';
import 'package:breezy/core/utils/router/route_names.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

Future<String> getAuthenticatedHomeRoute() async {
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
