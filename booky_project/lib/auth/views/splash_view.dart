import 'package:booky_project/auth/views/signup_view.dart';
import 'package:booky_project/styles/app_styles.dart';
import 'package:booky_project/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: change the background color based on device mode
      backgroundColor: AppColors.backgroundColorLight,
      body: SafeArea(
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left:24,top: kToolbarHeight+(MediaQuery.of(context).size.height/3.5)),
                    child: SizedBox(
                      // height: MediaQuery.of(context).size.height / 1.1,
                      child:
                          Image.asset("assets/logo/light-logo.png"),
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.only(
                    left:16, right: 16, bottom: kBottomNavigationBarHeight ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //TODO: localize text
                      PrimaryButton(
                        text: "Sign up",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpView(),),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      //TODO: localize text
                      PrimaryButton(
                        text: "Sign in",
                      hasBackground: false,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
