import 'package:find_events/src/api/model/event.dart';
import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.event});

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
            child: Hero(
              tag: 'event_${event.id}',
              child: Image.network(
                event.performers.first.image!,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
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