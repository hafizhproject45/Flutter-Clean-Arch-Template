import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:{{project_name}}/core/utils/sizes.dart';
import 'package:{{project_name}}/core/utils/styles.dart';
import 'package:{{project_name}}/core/utils/text_style.dart';
import 'package:{{project_name}}/core/utils/toast.dart';
import 'package:{{project_name}}/features/auth/presentation/cubit/auth.cubit.dart';
import 'package:{{project_name}}/injection_container.dart';
import 'package:{{project_name}}/presentation/widgets/global/button/my_button_widget.dart';
import 'package:{{project_name}}/presentation/widgets/global/textfield/textfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                width: GetSize.screenWidth(context),
                height: GetSize.screenHeight(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: Styles.container(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('LOGIN', style: AppTextStyle.headingBoldPrimary),
                          const SizedBox(height: 20),
                          TextFieldWidget(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            title: 'Email',
                            hint: 'Masukkan email',
                            validator: (value) {
                              String pattern =
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                              RegExp regex = RegExp(pattern);

                              if (value!.isEmpty) {
                                return 'Email wajib diisi';
                              } else if (!regex.hasMatch(value)) {
                                return "Email tidak valid";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFieldWidget(
                            isAuth: true,
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            title: 'Password',
                            hint: 'Masukkan password',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password wajib diisi";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is AuthError) {
                                showDangerToast(msg: state.message ?? '');
                              } else if (state is AuthLoggedIn) {
                                Get.offAllNamed('/navbar');
                              }
                            },
                            builder: (context, state) {
                              return MyButtonWidget(
                                label: 'Login',
                                fixedSize: true,
                                width: GetSize.screenWidth(context),
                                onPressed:
                                    state is AuthLoading
                                        ? null
                                        : () {
                                          if (state is! AuthLoading) {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                              context.read<AuthCubit>().login(
                                                emailController.text,
                                                passwordController.text,
                                              );
                                            }
                                          }
                                        },
                                isLoading: state is AuthLoading,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Text('© 2025 Copyright', style: AppTextStyle.small),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
