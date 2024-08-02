
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/logic/auth_cubit.dart';
import '../data/logic/auth_state.dart';
import '../widgets/custom_button_field.dart';
import '../widgets/custom_text_filed.dart';



class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Registration Page')),
        ),
        body: SingleChildScrollView(
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
                      coustumtextfield(
                        icon: const Icon(Icons.person),
                        controller: cubit.nameController,
                        label: 'name',
                        obscureText: false,
                      ),
                      const SizedBox(height: 16.0),
                      coustumtextfield(
                        icon: const Icon(Icons.phone),
                        controller: cubit.phoneController,
                        label: 'phone',
                        obscureText: false,
                      ),
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
                      (state is AuthLoding)?
                      const Center(child: CircularProgressIndicator()):
                      coustombuttonfield(
                        onPressed: (){
                          cubit.signup(context);
                        },
                        icon: const Icon(Icons.person_add),
                        label: ('Register'),
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      /* coustumtextbuttonfield(
                    label: Text('Log In'),
                    icon: Icon(Icons.login),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back or perform any other action
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                      // Add other customizations as needed
                    ),*/

                      TextButton.icon(
                        icon: const Icon(Icons.login),
                        label: const Text('Log In'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
