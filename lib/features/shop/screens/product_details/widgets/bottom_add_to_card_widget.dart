import 'package:madura_app/common/widgets/icons/circular_icon.dart';
import 'package:madura_app/features/authentication/User/models/product_model.dart';
import 'package:madura_app/utils/constants/colors.dart';
import 'package:madura_app/utils/constants/sizes.dart';
import 'package:madura_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddToCart extends StatelessWidget {
  final ProductModel product;

  const TBottomAddToCart({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace/2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text('2', style: Theme.of(context).textTheme.titleSmall,),
              const SizedBox(width: TSizes.spaceBtwItems,),
              const TCircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: product.stock > 0 ? () {} : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: product.stock > 0 ? TColors.black : Colors.grey,
              side: BorderSide(color: product.stock > 0 ? TColors.black : Colors.grey)
            ),
            child: Text(
              product.stock > 0 ? 'Add to Cart' : 'Out of Stock',
            ),
          ),
        ],
      ),
    );
  }
}