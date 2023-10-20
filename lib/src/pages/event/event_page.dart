import 'package:find_events/src/common/di/modules_config.dart';
import 'package:find_events/src/pages/event/event_view_model.dart';
import 'package:find_events/src/pages/event/widgets/event_current_city.dart';
import 'package:find_events/src/pages/event/widgets/event_footer.dart';
import 'package:find_events/src/pages/event/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final EventViewModel _viewModel = EventViewModel(
    RepositoryModule.eventRepository(),
    RepositoryModule.cityRepository(),
    RouterModule.router(),
  );
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _viewModel.onInit();
    });

    _scrollController.addListener(onEndReached);
  }

  @override
  void dispose() {
    super.dispose();

    _viewModel.dispose();
    _scrollController.removeListener(onEndReached);
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
        elevation: 2,
        actions: [
          EventCurrentCity(
            citySelected: _viewModel.citySelected!,
            onChangeCityClicked: _viewModel.onChangeCityClicked,
          )
        ],
      ),
      body: SafeArea(
        child: ChangeNotifierProvider.value(
          value: _viewModel,
          child: Consumer<EventViewModel>(
            builder: (_, viewModel, __) {
              if (viewModel.isInitialLoadingVisible) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                controller: _scrollController,
                // Add +1 to be able to display the footer
                itemCount: viewModel.events.length + 1,
                itemBuilder: (_, index) {
                  if (index < viewModel.events.length) {
                    final event = viewModel.events[index];

                    return InkWell(
                      onTap: () => viewModel.onEventClicked(event),
                      child: EventItem(key: Key('$index'), event: event),
                    );
                  } else {
                    return EventFooter(
                      isLoadingVisible: viewModel.isMoreLoadingVisible,
                      hasMoreElements: viewModel.hasMoreEvents,
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void onEndReached() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _viewModel.getMoreEvents();
    }
  }
}
