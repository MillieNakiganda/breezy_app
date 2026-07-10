import 'package:breezy/core/utils/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../server/server_client.dart';
import '../utils/router/routes.dart';

class Setting {
  final IconData leadingIcon;
  final String title;
  final IconData trailingIcon;
  final void Function(BuildContext context)? onTap;
  final String group;

  Setting({
    required this.leadingIcon,
    required this.title,
    required this.trailingIcon,
    this.onTap,
    required this.group,
  });
}

final clientSettings = [
  Setting(
    group: 'Account',
    title: 'Account Information',
    leadingIcon: PhosphorIcons.user,
    onTap: null,
    trailingIcon: PhosphorIcons.caretRight,
  ),
  Setting(
    group: 'Account',
    title: 'Change Password',
    leadingIcon: PhosphorIcons.lockSimple,
    onTap: null,
    trailingIcon: PhosphorIcons.caretRight,
  ),
  Setting(
    group: 'Account',
    title: 'Manage Homes',
    leadingIcon: PhosphorIcons.house,
    onTap: (context) => context.push(AppRoutes.manageHomes),
    trailingIcon: PhosphorIcons.caretRight,
  ),
  Setting(
    group: 'Legal',
    title: 'Terms & Conditions',
    leadingIcon: PhosphorIcons.file,
    onTap: null,
    trailingIcon: PhosphorIcons.caretRight,
  ),
  Setting(
    group: 'Legal',
    title: 'Privacy Policy',
    leadingIcon: PhosphorIcons.fileText,
    onTap: null,
    trailingIcon: PhosphorIcons.caretRight,
  ),
  Setting(
    group: 'Legal',
    title: 'Logout',
    leadingIcon: PhosphorIcons.signOut,
    onTap: (context) => ServerAuthLogic.serverClient.auth.signOutDevice(),
    trailingIcon: PhosphorIcons.caretRight,
  ),
];

Map<String, List<Setting>> clientGroupedSettingsList() {
  final groupedSettings = <String, List<Setting>>{};
  for (final setting in clientSettings) {
    groupedSettings.putIfAbsent(setting.group, () => []).add(setting);
  }
  return groupedSettings;
}

final cleanerSettings = [
  Setting(
    group: 'Account',
    title: 'Account Information',
    leadingIcon: PhosphorIcons.user,
    onTap: (context) => CleanerProfileDetailsRoute().push(context),
    trailingIcon: PhosphorIcons.caretRight,
  ),
  Setting(
    group: 'Account',
    title: 'Change Password',
    leadingIcon: PhosphorIcons.lockSimple,
    onTap: null,
    trailingIcon: PhosphorIcons.caretRight,
  ),
  Setting(
    group: 'Account',
    title: 'Availability',
    leadingIcon: PhosphorIcons.calendarBlank,
    onTap: null,
    trailingIcon: PhosphorIcons.caretRight,
  ),
  Setting(
    group: 'Legal',
    title: 'Terms & Conditions',
    leadingIcon: PhosphorIcons.file,
    onTap: null,
    trailingIcon: PhosphorIcons.caretRight,
  ),
  Setting(
    group: 'Legal',
    title: 'Privacy Policy',
    leadingIcon: PhosphorIcons.fileText,
    onTap: null,
    trailingIcon: PhosphorIcons.caretRight,
  ),
];

Map<String, List<Setting>> cleanerGroupedSettingsList() {
  final groupedSettings = <String, List<Setting>>{};
  for (final setting in cleanerSettings) {
    groupedSettings.putIfAbsent(setting.group, () => []).add(setting);
  }
  return groupedSettings;
}
