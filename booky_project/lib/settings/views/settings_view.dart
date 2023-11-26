import 'package:booky_project/styles/app_styles.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondaryColor,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
                size: 18,
              ),
              iconSize: 25,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: const Text("Settings"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text("Dark Mode"),
                const Spacer(),
                Switch.adaptive(
                  activeColor: AppColors.secondaryColor,
                  value: false,
                  onChanged: (bool value) {},
                )
              ],
            ),
            Row(
              children: [
                const Text("English"),
                const Spacer(),
                Switch.adaptive(
                  activeColor: AppColors.secondaryColor,
                  value: true,
                  onChanged: (bool value) {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
