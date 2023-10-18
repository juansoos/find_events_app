import 'package:find_events/src/common/di/modules_config.dart';
import 'package:find_events/src/pages/authentication/authentication_view_model.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final AuthenticationViewModel _viewModel = AuthenticationViewModel(
    RouterModule.router(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}