import 'package:madura_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key, 
    this.icon = Iconsax.arrow_right_34, 
    required this.onPressed, 
    required this.title, 
    required this.value,
    this.showIcon = true
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(title, style: Theme.of(context).textTheme.bodySmall, overflow:TextOverflow.ellipsis,)),
            Expanded(flex: 5, child: Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow:TextOverflow.ellipsis,)),
            Expanded(
              child: Opacity(
                opacity: showIcon ? 1.0 : 0.0,
                child: Icon(icon, size: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}