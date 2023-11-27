import 'package:booky_project/bloc/locale_bloc/locale_bloc.dart';
import 'package:booky_project/bloc/theme_bloc/theme_bloc.dart';
import 'package:booky_project/styles/app_styles.dart';
import 'package:booky_project/styles/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                size: 18,
              ),
              iconSize: 25,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(AppLocalizations.of(context)!.dark),
                const Spacer(),
                BlocBuilder<ThemeBloc, ThemeUpdatedState>(
                  builder: (context, state) {
                    return Switch.adaptive(
                      activeColor: AppColors.secondaryColor,
                      value: state.themeData == darkTheme,
                      onChanged: (bool value) {
                        context.read<ThemeBloc>().add(ChangeThemeEvent(value));
                      },
                    );
                  },
                )
              ],
            ),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.english),
                const Spacer(),
                BlocBuilder<LocaleBloc, LocaleUpdatedState>(
                  builder: (context, state) {
                    return Switch.adaptive(
                      activeColor: AppColors.secondaryColor,
                      value: state.locale == const Locale('en'),
                      onChanged: (bool value) {
                        context
                            .read<LocaleBloc>()
                            .add(ChangeLocaleEvent(value));
                      },
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
