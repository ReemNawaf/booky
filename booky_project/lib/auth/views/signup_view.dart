import 'package:flutter/material.dart';
import 'package:booky_project/styles/app_styles.dart';
import 'package:booky_project/widgets/primary_button.dart';
import 'package:booky_project/styles/my_icons.dart';

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
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscureText = true;
  bool _isValid = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        //TODO: change the background color based on device mode
        backgroundColor: AppColors.backgroundColorLight,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColorLight,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          leadingWidth: 80,
          leading: IconButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.white30),
              elevation: MaterialStateProperty.all(0),
              padding: MaterialStateProperty.all(const EdgeInsets.only(
                  left: 14, right: 6, top: 10, bottom: 10)),
              backgroundColor: MaterialStateProperty.all(
                AppColors.secondaryColor,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            icon: const Icon(Icons.arrow_back_ios, size: 22),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            //TODO: localize text
            "Create an Account",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColorLight,
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
                      //TODO: add Loading indicator that provided in the README file
                      ] else ...[
                        _title("Full Name"),
                        const SizedBox(height: 4),
                        _buildName(),
                        const SizedBox(height: 16),
                        _title("Email Address"),
                        const SizedBox(height: 4),
                        _buildEmail(),
                        const SizedBox(height: 16),
                        _title("Password"),
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
                              text: "Create an Account",
                              onPressed: _createAccount,
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

  //TODO: localize text
  Widget _title(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.textColorLight,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildName() {
    return TextFormField(
      key: const ValueKey("Name"),
      controller: _nameController,
      //TODO: add validator
      cursorColor: AppColors.secondaryColor,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_emailFocusNode),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        focusColor: AppColors.secondaryColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        //TODO: localize text
        hintText: "Full Name",
        hintStyle: TextStyle(
          color: AppColors.subTitle,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor),
        ),
        fillColor: AppColors.inputBackgroundColorLight,
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
          return "Please enter a valid email";
        }
        return null;
      },
      cursorColor: AppColors.secondaryColor,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_passwordFocusNode),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        errorStyle: TextStyle(color: AppColors.errorColor, fontSize: 14),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        focusColor: AppColors.secondaryColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        //TODO: localize text
        hintText: "Email Address",
        hintStyle: TextStyle(
          color: AppColors.subTitle,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor),
        ),
        fillColor: AppColors.inputBackgroundColorLight,
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
          return "Please enter a valid password";
        }
        return null;
      },
      cursorColor: AppColors.secondaryColor,
      keyboardType: TextInputType.visiblePassword,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
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
        fillColor: AppColors.inputBackgroundColorLight,
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

  void _createAccount() {
    //TODO: create your account with firebase
  }
}
