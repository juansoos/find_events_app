import 'package:find_events/src/common/di/modules_config.dart';
import 'package:find_events/src/config/typography.dart';
import 'package:find_events/src/pages/city_picker/city_picker_view_model.dart';
import 'package:flutter/material.dart';

class CityPickerPage extends StatefulWidget {
  const CityPickerPage({super.key});

  @override
  State<CityPickerPage> createState() => _CityPickerPageState();
}

class _CityPickerPageState extends State<CityPickerPage> {
  final CityPickerViewModel _viewModel = CityPickerViewModel(
    RouterModule.router(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Selecciona una ciudad",
                style: CustomTypography.headline2,
              ),
              const SizedBox(height: 16),
              const Text(
                "Para continuar, selecciona la ciudad de la cual deseas obtener información de eventos",
                style: CustomTypography.body2,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _viewModel.cities.length,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemBuilder: (BuildContext context, int index) {
                    final city = _viewModel.cities[index];

                    return ListTile(
                      leading: const Icon(Icons.location_city),
                      title: Text(city),
                      onTap: () {
                        _viewModel.onCitySelected(index);
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
