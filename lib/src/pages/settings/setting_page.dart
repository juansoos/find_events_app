import 'package:find_events/generated/l10n.dart';
import 'package:find_events/src/common/di/modules_config.dart';
import 'package:find_events/src/pages/settings/settings_view_model.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsViewModel _viewModel = SettingsViewModel(
    RouterModule.router(),
    InteractorModule.logoutInteractor(),
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
      appBar: AppBar(
        title: Text(i18n.settings),
        elevation: 2,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _viewModel.onChangeCityClicked,
                  child: Text(i18n.changeCity),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _viewModel.onLogoutClicked,
                  child: Text(i18n.logout),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
