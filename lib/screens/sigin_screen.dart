
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_project/screens/signup_screen.dart';


import '../data/logic/auth_cubit.dart';
import '../data/logic/auth_state.dart';
import '../widgets/custom_button_field.dart';
import '../widgets/custom_text_filed.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('login Page')),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: BlocBuilder<AuthCubit, AuthStates>(
                  builder: (context, state) {
                    var cubit = AuthCubit.get(context);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 16.0),
                        const SizedBox(height: 16.0),
                        coustumtextfield(
                          label: 'Email',
                          icon: const Icon(Icons.email_outlined),
                          controller: cubit.emailController,
                          obscureText: false,
                        ),
                        const SizedBox(height: 16.0),
                        coustumtextfield(
                          icon: const Icon(Icons.lock),
                          controller: cubit.passwordController,
                          label: 'password',
                          obscureText: true,
                        ),
                        const SizedBox(height: 16.0),
                        (state is AuthLoding)
                            ? const Center(child: CircularProgressIndicator())
                            : coustombuttonfield(
                          onPressed: () {
                            cubit.login(context);
                          },
                          icon: const Icon(Icons.person_add),
                          label: 'login',
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextButton.icon(
                          icon: const Icon(Icons.app_registration),
                          label: const Text('Register'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegistrationPage()),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        if (state is AuthError)
                          const Text(
                            'you have a Mistake',
                            style: TextStyle(color: Colors.red),
                          )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
