import 'package:find_events/src/api/model/event.dart';
import 'package:find_events/src/config/configuration.dart';
import 'package:find_events/src/pages/event_detail/event_detail_view_model.dart';
import 'package:find_events/src/pages/event_detail/widgets/event_detail_description.dart';
import 'package:find_events/src/pages/event_detail/widgets/event_detail_location_info.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key, required this.event});

  final Event event;

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  final EventDetailViewModel _viewModel = EventDetailViewModel();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event.title),
        elevation: 2,
      ),
      body: Column(
        children: [
          Hero(
            tag: 'event_${widget.event.id}',
            child: Image.network(
              widget.event.performers.first.image!,
              width: width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.event.title,
                  style: CustomTypography.headline3,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                EventDetailLocationInfo(
                  location: widget.event.venue.address,
                  date: widget.event.datetimeUtc,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _viewModel.onLaunchClicked(widget.event.venue.url);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    minimumSize: Size(width, 48),
                  ),
                  child: const Text('Buy ticket'),
                ),
                EventDetailDescription(description: widget.event.description)
              ],
            ),
          )
        ],
      ),
    );
  }
}
