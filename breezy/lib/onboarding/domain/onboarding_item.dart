import '../../core/utils/images.dart';

class OnboardingTitlePart {
  final String text;
  final bool highlighted;

  const OnboardingTitlePart({required this.text, this.highlighted = false});
}

class OnboardingItem {
  final List<OnboardingTitlePart> titleParts;
  final String description;
  final String imagePath;

  OnboardingItem({
    required this.titleParts,
    required this.description,
    required this.imagePath,
  });
}

List<OnboardingItem> onboardingItems = [
  OnboardingItem(
    titleParts: [
      OnboardingTitlePart(text: 'Find ', highlighted: true),
      OnboardingTitlePart(text: 'Trusted', highlighted: true),
      const OnboardingTitlePart(text: ' Cleaners'),
    ],
    description:
        'Connect with verfied professionals in your area in your area and book with confidence.',
    imagePath: Images.onboardingCleanersIllustration,
  ),

  OnboardingItem(
    titleParts: [
      OnboardingTitlePart(text: 'Transparent', highlighted: true),
      const OnboardingTitlePart(text: ' Pricing'),
    ],
    description:
        'No hidden fees, no surprises. Just clear, upfront pricing for all our services before you book.',
    imagePath: Images.onboardingTranparentPricingIllustration,
  ),
  OnboardingItem(
    titleParts: [
      const OnboardingTitlePart(text: 'Top '),
      OnboardingTitlePart(text: 'Verified ', highlighted: true),
      OnboardingTitlePart(text: 'Reviews', highlighted: true),
    ],
    description:
        'Every Breezy cleaner goes through identity verification and is approved by our team before they ever step into your home.',
    imagePath: Images.onboardingReviewedCleanersIllustration,
  ),
];
