import 'package:madura_app/data/repositories/user%20&%20admin/user_repository.dart';
import 'package:madura_app/features/personalization/controllers/user_controller.dart';
import 'package:madura_app/utils/helpers/network_manager.dart';
import 'package:madura_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  // variabel
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init home data when home screen muncul
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      // TFullScreenLoader.openLoadingDialog('Kami sedang mengupdate informasi anda...', TImages.loadingJson);
      

      // Check internet connection
      final isConnected =  await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // TFullScreenLoader.stopLoading();
        return;
      }

      // Form validasi
      if (!updateUserNameFormKey.currentState!.validate()) {
        // TFullScreenLoader.stopLoading();
        return;
      }

      // Update user first name & last name in firebase firestore
      Map<String, dynamic> name = {'FirstName' : firstName.text.trim(), 'LastName' : lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove loader
      // TFullScreenLoader.stopLoading();

      // close Dialog
      Get.back();

      await Future.delayed(const Duration(milliseconds: 125));

      // show success screen
      TLoaders.successSnackBar(title: 'Selamat', message: 'Data anda berhasil di update');

      // Refresh user data
      userController.user.refresh();

      // Pindah ke halaman sebelumnya
      // Get.back();
      // Get.off(() => const ProfileScreen(), preventDuplicates: true, transition: Transition.noTransition);

    } catch (e) {
      // Remove loader
      // TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}