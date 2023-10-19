import 'package:find_events/src/api/model/city.dart';
import 'package:find_events/src/common/di/modules_config.dart';
import 'package:find_events/src/config/typography.dart';
import 'package:find_events/src/pages/city_picker/city_picker_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class CityPickerPage extends StatefulWidget {
  const CityPickerPage({super.key});

  @override
  State<CityPickerPage> createState() => _CityPickerPageState();
}

class _CityPickerPageState extends State<CityPickerPage> {
  final CityPickerViewModel _viewModel = CityPickerViewModel(
    RouterModule.router(),
    RepositoryModule.cityRepository(),
  );

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _viewModel.onInit();
    });
  }

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
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Select a city",
                style: CustomTypography.headline2,
              ),
              const SizedBox(height: 16),
              const Text(
                "To continue, select the city for which you wish to obtain event information.",
                style: CustomTypography.body2,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ChangeNotifierProvider.value(
                  value: _viewModel,
                  child: Consumer<CityPickerViewModel>(
                    builder: (_, viewModel, __) {
                      if (viewModel.isLoadingVisible) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: viewModel.cities.length,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        itemBuilder: (BuildContext context, int index) {
                          final city = viewModel.cities[index];

                          return _CityItem(
                            key: Key('$index'),
                            item: city,
                            onTap: () => viewModel.onCitySelected(index),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 16);
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CityItem extends StatelessWidget {
  const _CityItem({super.key, required this.item, this.onTap});

  final City item;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(item.thumbnail),
      ),
      title: Text(item.name),
      onTap: onTap,
    );
  }
}
