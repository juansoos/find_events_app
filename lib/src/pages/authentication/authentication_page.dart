import 'package:find_events/src/common/di/modules_config.dart';
import 'package:find_events/src/common/di/repository_module.dart';
import 'package:find_events/src/config/typography.dart';
import 'package:find_events/src/pages/authentication/authentication_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final AuthenticationViewModel _viewModel = AuthenticationViewModel(
    RouterModule.router(),
    RepositoryModule.userRepository(),
  );

  @override
  void dispose() {
    super.dispose();

    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChangeNotifierProvider.value(
            value: _viewModel,
            child: Consumer<AuthenticationViewModel>(
              builder: (_, viewModel, __) {
                if (viewModel.isLoadingVisible) {
                  return const _Loader();
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      onChanged: _viewModel.onEmailChanged,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: _viewModel.onPasswordChanged,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter secure password',
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _viewModel.onSubmitClicked,
                      child: const Text('Login'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "We are validating your information, give us a moment.",
          textAlign: TextAlign.center,
          style: CustomTypography.headline3,
        ),
        SizedBox(height: 40),
        CircularProgressIndicator()
      ],
    );
  }
}
