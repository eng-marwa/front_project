import 'package:front_project/core/resources/app_icons.dart';
import 'package:front_project/features/onboarding/presentation/ui_models/onboarding_ui_model.dart';

class AppUiConstants {
  AppUiConstants._();

  static final List<OnboardingUiModel> onboardingList = [
    OnboardingUiModel(
      title: 'Now reading books will be easier',
      description:
          'Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
      imageAsset: AppIcons.onboarding2,
    ),
    OnboardingUiModel(
      title: 'Your Bookish Soulmate Awaits',
      description:
          'Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.',
      imageAsset: AppIcons.onboarding1,
    ),
    OnboardingUiModel(
      title: 'Start Your Adventure',
      description:
          "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!",
      imageAsset: AppIcons.onboarding3,
    ),
  ];
}
