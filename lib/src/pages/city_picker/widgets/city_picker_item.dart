import 'package:find_events/src/api/model/city.dart';
import 'package:flutter/material.dart';

class CityPickerItem extends StatelessWidget {
  const CityPickerItem({super.key, required this.item, this.onTap});

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
