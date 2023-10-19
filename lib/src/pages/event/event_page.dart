import 'package:find_events/src/api/model/event.dart';
import 'package:find_events/src/common/di/repository_module.dart';
import 'package:find_events/src/config/configuration.dart';
import 'package:find_events/src/pages/event/event_view_model.dart';
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
    return SafeArea(
      child: ChangeNotifierProvider.value(
        value: _viewModel,
        child: Consumer<EventViewModel>(
          builder: (_, viewModel, __) {
            if (viewModel.isLoadingVisible) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: viewModel.events.length,
              itemBuilder: (_, index) {
                final event = viewModel.events[index];

                return _EventItem(event: event);
              },
            );
          },
        ),
      ),
    );
  }
}

class _EventItem extends StatelessWidget {
  const _EventItem({required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            child: Image.network(
              event.performers.first.image!,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            event.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTypography.title1,
          ),
          Row(
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 14),
                  const SizedBox(width: 4),
                  Text(event.venue.address, style: CustomTypography.caption1),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  const Icon(Icons.calendar_month_outlined, size: 14),
                  const SizedBox(width: 4),
                  Text(event.datetimeUtc, style: CustomTypography.caption1)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
