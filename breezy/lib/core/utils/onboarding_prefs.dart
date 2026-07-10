import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPrefs {
  OnboardingPrefs._();

  static const _key = 'onboarded';
  static bool? _cachedHasOnboarded;

  static Future<bool> hasOnboarded() async {
    if (_cachedHasOnboarded != null) return _cachedHasOnboarded!;

    final prefs = await SharedPreferences.getInstance();
    _cachedHasOnboarded = prefs.getBool(_key) ?? false;
    return _cachedHasOnboarded!;
  }

  static Future<void> setOnboarded() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
    _cachedHasOnboarded = true;
  }
}
