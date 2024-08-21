import 'package:flutter_bloc/flutter_bloc.dart';

// import '../pages/confirm_password_page.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  static const String id = 'resetPassword';
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late TextEditingController emailController;
  @override
  void initState() {
    emailController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Reset Password',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomTextFormField(
                controller: emailController,
                hintText: 'ex@gmail.com',
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomElevatedButton(
                // onPressed: () {
                //   Navigator.of(context).push(
                //     MaterialPageRoute<void>(
                //       builder: (BuildContext context) =>
                //           const ConfirmPasswrdPage(),
                //     ),
                //   );
                // },
                onPressed: () async {
                  await context.read<AuthCubit>().resetPassword(
                        emailController.text,
                        context: context,
                        // emailController: emailController,
                      );
                },
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
