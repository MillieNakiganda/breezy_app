import 'app_spacing.dart';

abstract final class AppSizes {
  static const iconSm = 16.0;
  static const iconMd = 24.0;
  static const iconStarSm = 14.0;

  static const buttonHeightSm = 32.0;
  static const buttonWidthSm = 72.0;
  static const filterIconPadding = 12.0;

  static const avatarMd = 50.0;

  static const cardImageWidth = 80.0;
  static const cardImageHeight = 100.0;
  static const cardBorderWidth = 0.8;
  static const cardListItemExtent =
      cardImageHeight + (AppSpacing.sm * 2) + (cardMargin * 2);

  static const cardMargin = 4.0;

  static const navBarHeight = 56.0;

  static const radiusSm = 8.0;
  static const radiusMd = 16.0;
  static const radiusLg = 20.0;
  static const radiusXl = 30.0;

  static const searchFieldFlex = 82;
}
