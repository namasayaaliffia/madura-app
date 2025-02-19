import 'package:madura_app/common/widgets/appbar/appbar.dart';
import 'package:madura_app/data/repositories/product/product_repository.dart';
import 'package:madura_app/features/authentication/Admin/Product/widgets/product_add_form.dart';
import 'package:madura_app/features/authentication/Admin/widgets/admin_sidebar.dart';
import 'package:madura_app/utils/constants/colors.dart';
import 'package:madura_app/utils/constants/sizes.dart';
import 'package:madura_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddScreen extends StatelessWidget {
  const ProductAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize dependencies
    Get.put(ProductRepository());
    
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      key: scaffoldKey, // Add this line to connect scaffoldKey
      appBar: TAppBar(
        title: const Text('Add Product'),
        // leadingIcon: Icons.menu,
        showBackArrow: true,
        leadingOnPressed: () => scaffoldKey.currentState?.openDrawer(),
        backgroundColor: dark ? TColors.dark : TColors.light,
      ),
      drawer: const AdminSidebar(),
      body: SingleChildScrollView( // Add this to make form scrollable
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ProductAddForm(),
        ),
      ),
    );
  }
}