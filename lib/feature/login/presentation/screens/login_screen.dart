import 'package:eterex/core/route/app_route.dart';
import 'package:eterex/feature/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController(text: 'eve.holt@reqres.in');
    passwordController = TextEditingController(text: 'cityslicka');
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: emailController,
            onChanged: (value) =>
                context.read<LoginBloc>().add(ChangeEmail(value)),
            decoration: InputDecoration(
                labelText: 'User name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: passwordController,
            onChanged: (value) =>
                context.read<LoginBloc>().add(ChangePass(value)),
            decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
          ),
          const SizedBox(height: 32),
          BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is GoToMainScreen) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.of(context).popAndPushNamed(AppRouts.main);
              });
            }
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    if (state is Login) {
                      context.read<LoginBloc>().add(OnLoginClick());
                    } else {
                      // handle register
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).primaryColor,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                          state is Loading
                              ? 'please wait'
                              : state is SignUp
                                  ? 'Register'
                                  : 'Login',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: Colors.white))),
                ),
                const SizedBox(height: 16),
                InkWell(
                    onTap: () =>
                        context.read<LoginBloc>().add(OnChangeStatusClick()),
                    child: Text(state is SignUp
                        ? 'already have an account? Login'
                        : 'don\'t have an account yet? Create one.')),
              ],
            );
          }),
        ]),
      ),
    );
  }
}
