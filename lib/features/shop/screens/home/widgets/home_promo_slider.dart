import 'package:carousel_slider/carousel_slider.dart';
import 'package:madura_app/common/widgets/images/t_rounded_image.dart';
import 'package:madura_app/features/shop/controllers/home_controller.dart';
import 'package:madura_app/utils/constants/colors.dart';
import 'package:madura_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, 
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
        ),
        // ignore: prefer_const_constructors
        SizedBox(height: TSizes.spaceBtwItems,),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                // TCircularContainer(
                //   width: 20,
                //   height: 4,
                //   margin: EdgeInsets.only(right: 10),
                //   backgroundColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey,
                // ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300), // Durasi animasi
                  curve: Curves.easeInOut, // Kurva animasi
                  width: controller.carouselCurrentIndex.value == i ? 20 : 4,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10,),
                  decoration: BoxDecoration(
                    color: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}