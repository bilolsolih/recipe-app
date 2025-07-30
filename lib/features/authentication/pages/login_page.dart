import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe/core/client.dart';
import 'package:recipe/core/utils/colors.dart';
import 'package:recipe/core/utils/styles.dart';
import 'package:recipe/features/common/widgets/buttons/recipe_filled_button.dart';
import 'package:recipe/features/common/widgets/recipe_text_form_field.dart';

Future<String> login({required String login, required String password}) async {
  var response = await dio.post(
    '/auth/login',
    data: {"login": login, "password": password},
  );

  if (response.statusCode != 200) {
    throw Exception("Login qilishda xatolik.");
  }

  return response.data['accessToken'];
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login", style: AppStyles.title),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(37.w, 150.h, 37.w, 0),
          child: Column(
            children: [
              RecipeTextFormField(
                controller: emailController,
                label: "Email",
                hintText: "example@example.com",
                validator: (value) => null,
              ),
              SizedBox(height: 10.h),
              RecipeTextFormField(
                controller: passwordController,
                label: "Password",
                hintText: "12345678",
                isPassword: true,
                validator: (value) => null,
              ),
              SizedBox(height: 89.h),
              RecipeFilledButton(
                text: "Log in",
                onPressed: () async {
                  var token = await login(
                    login: emailController.text,
                    password: passwordController.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(token)));
                },
                size: Size(207.w, 45.h),
                fontSize: 20.r,
              ),
              SizedBox(height: 27.h),
              RecipeFilledButton(
                text: "Sign up",
                onPressed: () {},
                foregroundColor: AppColors.pinkSub,
                backgroundColor: AppColors.pink,
                size: Size(207.w, 45.h),
                fontSize: 20.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
