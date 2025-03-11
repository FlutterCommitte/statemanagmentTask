import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task/features/Auth/Presentation/widgets/SocialLoginOptionsSection.dart';
import '../../../../../Core/utils/styles/textStyles.dart';
import '../../cubits/signInCubit/cubit/sign_in_cubit.dart';
import 'LoginFormSection.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInFailure) { // state here has error message
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is SignInSuccess) {// if success i will go home
            // GoRouter.of(context).go(AppRoutes.home);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SignInLoading,// if state is true so i will make CircularProgressIndicator
            child: Padding( // Inial State  or state not loading
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const LoginFormSection(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "نسيت كلمة المرور؟",
                            style: TextStyles.semiBold13,
                          ),
                        ),
                      ],
                    ),
                    const SocialLoginOptionsSection(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
