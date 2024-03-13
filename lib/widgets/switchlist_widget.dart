import 'package:flutter/material.dart';

class SwitchListWidget extends StatelessWidget {
  const SwitchListWidget({
    super.key,
    required this.value,
    required this.title,
    required this.subtitile,
    required this.onChanged,
  });

  final bool value;
  final String title, subtitile;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        subtitile,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 32),
    );
  }
}
