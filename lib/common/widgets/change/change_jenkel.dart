import 'package:madura_app/common/widgets/appbar/appbar.dart';
import 'package:madura_app/features/authentication/User/controllers/user/update_jenkel_controller.dart';
import 'package:madura_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeJenkel extends StatelessWidget {
  const ChangeJenkel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateJenkelController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Ubah Jenis Kelamin', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih jenis kelamin anda untuk melengkapi data profile.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Radio Buttons
            Form(
              key: controller.updateJenkelFormKey,
              child: Column(
                children: [
                  Obx(
                    () => Column(
                      children: [
                        RadioListTile<String>(
                          title: const Text('Laki-laki'),
                          value: 'Laki-laki',
                          groupValue: controller.selectedGender.value,
                          onChanged: (value) => controller.setGender(value!),
                        ),
                        RadioListTile<String>(
                          title: const Text('Perempuan'),
                          value: 'Perempuan',
                          groupValue: controller.selectedGender.value,
                          onChanged: (value) => controller.setGender(value!),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserJenkel(),
                child: const Text('Simpan'),
              ),
            )
          ],
        ),
      ),
    );
  }
}