import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/errors/get_it.dart';
import '../../Data/repos/authRepo.dart';
import '../../cubits/signInCubit/cubit/sign_in_cubit.dart';
import '../widgets/LoginViewBody.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
