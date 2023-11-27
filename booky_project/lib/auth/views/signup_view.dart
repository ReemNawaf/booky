import 'package:booky_project/home/book_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:booky_project/styles/app_styles.dart';
import 'package:booky_project/widgets/primary_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscureText = true;
  bool _isValid = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        //TODO: change the background color based on device mode
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
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
          title: Text(
            AppLocalizations.of(context)!.createAccount,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: kBottomNavigationBarHeight,
                      top: kTextTabBarHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_isLoading) ...[
                        const SizedBox(height: kTextTabBarHeight + 100),
                        const Center(
                          child: SizedBox(
                            height: 50,
                            width: 150,
                            child: LoadingIndicator(
                              indicatorType: Indicator.ballBeat,
                              colors: [
                                AppColors.primaryColor,
                                AppColors.secondaryColor,
                              ],
                              strokeWidth: 0.5,
                            ),
                          ),
                        ),
                      ] else ...[
                        _title(AppLocalizations.of(context)!.fullName),
                        const SizedBox(height: 4),
                        _buildName(),
                        const SizedBox(height: 16),
                        _title(AppLocalizations.of(context)!.email),
                        const SizedBox(height: 4),
                        _buildEmail(),
                        const SizedBox(height: 16),
                        _title(AppLocalizations.of(context)!.password),
                        const SizedBox(height: 4),
                        _buildPassword(),
                        const SizedBox(height: 16),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: _isLoading
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: kBottomNavigationBarHeight),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //TODO: localize text
                            PrimaryButton(
                              text: AppLocalizations.of(context)!.createAccount,
                              onPressed: (_formKey.currentState != null &&
                                          _formKey.currentState!.validate()) &&
                                      _isValid
                                  ? _createAccount
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildName() {
    return TextFormField(
      key: const ValueKey("Name "),
      controller: _nameController,
      validator: (value) {
        if (value!.isEmpty) {
          //TODO: localize text
          return AppLocalizations.of(context)!.nameError;
        }
        return null;
      },
      cursorColor: AppColors.secondaryColor,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_emailFocusNode),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),

        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        focusColor: AppColors.secondaryColor,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        //TODO: localize text
        hintText: AppLocalizations.of(context)!.fullName,
        hintStyle: const TextStyle(
          color: AppColors.subTitle,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor),
        ),
      ),
      onSaved: (value) {
        _nameController.text = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: _emailController,
      key: const ValueKey("Email"),
      validator: (value) {
        if (value!.isEmpty || !value.contains("@")) {
          //TODO: localize text
          return AppLocalizations.of(context)!.emaileError;
        }
        return null;
      },
      cursorColor: AppColors.secondaryColor,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_passwordFocusNode),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 14),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        focusColor: AppColors.secondaryColor,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        //TODO: localize text
        hintText: AppLocalizations.of(context)!.email,
        hintStyle: const TextStyle(
          color: AppColors.subTitle,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor),
        ),
      ),
      onSaved: (value) {
        _emailController.text = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      key: const ValueKey("Password"),
      controller: _passController,
      validator: (value) {
        if (value!.isEmpty) {
          //TODO: localize text
          return AppLocalizations.of(context)!.passwordError;
        }
        return null;
      },
      cursorColor: AppColors.secondaryColor,
      keyboardType: TextInputType.visiblePassword,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 14),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        focusColor: AppColors.secondaryColor,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor),
        ),
        hintText: "*********",
        hintStyle: const TextStyle(
          color: AppColors.subTitle,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      onSaved: (value) {
        _passController.text = value!;
      },
      textInputAction: TextInputAction.done,
      obscureText: _obscureText,
      onChanged: (_) {
        setState(() {
          _isValid = true;
        });
      },
    );
  }

  void _createAccount() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passController.text.trim())
          .then(
            (value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: AppColors.secondaryColor,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                showCloseIcon: true,
                behavior: SnackBarBehavior.floating,
                closeIconColor: AppColors.textColorLight,
                content: Text(
                  //TODO: localize text
                  'You have successfully created your account! 🥳',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BookSearchScreen(),
        ),
      );
      setState(() => _isLoading = false);
    } on Exception catch (e) {
      setState(() => _isLoading = false);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.errorColor,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          closeIconColor: Colors.white,
          content: Text(
            '$e',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }
}
