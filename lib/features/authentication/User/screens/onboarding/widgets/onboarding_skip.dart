import 'package:madura_app/features/authentication/User/controllers/onboarding/onboarding_controller.dart';
import 'package:madura_app/utils/constants/sizes.dart';
import 'package:madura_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child:
        TextButton(
            onPressed: () => OnBoardingController.instance.skipPage(),
            child: const Text('Skip')
        )
    );
  }
}