import 'package:booky_project/bloc/theme_bloc/theme_bloc.dart';
import 'package:booky_project/home/book_search_screen.dart';
import 'package:booky_project/styles/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:booky_project/auth/views/signup_view.dart';
import 'package:booky_project/widgets/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashView extends StatelessWidget {
  const SplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: change the background color based on device mode
      body: SafeArea(
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 24,
                        top: kToolbarHeight +
                            (MediaQuery.of(context).size.height / 3.5)),
                    child: SizedBox(
                      // height: MediaQuery.of(context).size.height / 1.1,
                      child: BlocBuilder<ThemeBloc, ThemeUpdatedState>(
                        builder: (context, state) {
                          if (state.themeData == lightTheme) {
                            return Image.asset("assets/logo/light-logo.png");
                          } else {
                            return Image.asset("assets/logo/dark-logo.png");
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: kBottomNavigationBarHeight),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //TODO: localize text
                      PrimaryButton(
                        text: AppLocalizations.of(context)!.signup,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpView(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      //TODO: localize text
                      PrimaryButton(
                        text: AppLocalizations.of(context)!.signin,
                        hasBackground: false,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BookSearchScreen(),
                            ),
                          );
                        },
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
