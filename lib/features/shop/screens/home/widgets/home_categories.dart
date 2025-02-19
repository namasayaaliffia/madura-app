import 'package:madura_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:madura_app/common/widgets/texts/section_heading.dart';
import 'package:madura_app/features/shop/screens/sub_category/sub_categories.dart';
import 'package:madura_app/utils/constants/colors.dart';
import 'package:madura_app/utils/constants/image_strings.dart';
import 'package:madura_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.only(left: TSizes.defaultSpace),
     child: Column(
       children: [
    
         // Heading
         const TSectionHeading(title: 'Kategori Populer', showActionButton: false, textColor: TColors.grey,),
         const SizedBox(height: TSizes.spaceBtwItems,),
    
         // Categories
         SizedBox(
           height: 80,
           child: ListView.builder(
             shrinkWrap: true,
             itemCount: 6,
             scrollDirection: Axis.horizontal,
             itemBuilder: (_, index){
               return TVerticalImageText(image: TImages.shoeIcon, title: 'Sepatu', onTap: () => Get.to(() => const SubCategoriesScreen()),);
             },
           ),
         )
       ],
     ),
     );
  }
}