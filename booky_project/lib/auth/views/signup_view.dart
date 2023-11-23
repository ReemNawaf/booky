import 'dart:async';
import 'package:booky_project/styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:booky_project/styles/app_styles.dart';
import 'package:booky_project/widgets/primary_button.dart';

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
  bool _isLoading = false;
  bool _obscureText = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool get _isValid =>
      _nameController.text.isNotEmpty &&
      _emailController.text.isNotEmpty &&
      _passController.text.isNotEmpty ;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(left: 16, right: 8, top: 12, bottom: 12)),
            backgroundColor: MaterialStateProperty.all(
              AppColors.secondaryColor,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Create an Account",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textColorLight,
            fontSize: 24,
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
                ),
              ),
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
                      text: "Create an Account",
                      onPressed:_formKey.currentState!=null&& _formKey.currentState!.validate()
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
      key: const ValueKey("Name "),
      validator: (value) {
        if (value!.isEmpty) {
          return "Name cannot be empty";
        }
        return null;
      },
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
      key: const ValueKey("Email"),
      validator: (value) {
        if (value!.isEmpty || !value.contains("@")) {
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
        validator: (value) {
          if (value!.isEmpty || value.length < 7) {
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
          errorStyle:
              const TextStyle(color: AppColors.errorColor, fontSize: 14),
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
        obscureText: _obscureText,
        onEditingComplete: () =>
            _formKey.currentState!.validate() ? _createAccount() : null);
  }

  void _createAccount() async {
    FocusScope.of(context).unfocus();
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      if (_formKey.currentState!.validate()) {
        //TODO: setup the firebase for both Android and ios
        //   //TODO: enable signin method for email and password in firebase
         await  _auth
              .signInWithEmailAndPassword(
                  email: _emailController.text.trim(),
                  password: _passController.text.trim())
              .then((value) =>
                 ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'You have successfully created your account!🥳'),
            ),
          ),);
        setState(() => _isLoading = false);
      } else {
        setState(() => _isLoading = false);
        //TODO: instead of snackbar o to success page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'an error has occurred while creating the account, try again!'),
          ),
        );
      }
    } on Exception catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$e')),
      );
    }
  }
}
