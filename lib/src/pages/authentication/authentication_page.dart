import 'package:find_events/generated/l10n.dart';
import 'package:find_events/src/common/di/modules_config.dart';
import 'package:find_events/src/pages/authentication/authentication_view_model.dart';
import 'package:find_events/src/pages/authentication/widgets/loader.dart';
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
    final i18n = I18n();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChangeNotifierProvider.value(
            value: _viewModel,
            child: Consumer<AuthenticationViewModel>(
              builder: (_, viewModel, __) {
                if (viewModel.isLoadingVisible) {
                  return const Loader();
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      onChanged: _viewModel.onEmailChanged,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: i18n.email,
                        hintText: i18n.enterEmail,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: _viewModel.onPasswordChanged,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: i18n.password,
                        hintText: i18n.enterPassword,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _viewModel.onSubmitClicked,
                      child: Text(i18n.login),
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
