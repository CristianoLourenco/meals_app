import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/controller/data/enum/enum_file.dart';
import 'package:meals_app/controller/provider/filters_provider.dart';
import 'package:meals_app/view/widgets/switchlist_widget.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // PopScope alow block manually back
      body: Column(
        children: [
          // New Widget
          SwitchListWidget(
            value: activeFilters[Filter.glutenFree]!,
            title: 'Gluten-free',
            subtitile: 'Only include gluten-free meals.',
            onChanged: (isCheked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isCheked);
            },
          ),
          SwitchListWidget(
              value: activeFilters[Filter.lactoseFree]!,
            title: 'Lactose-free',
            subtitile: 'Only include Lactose-free meals.',
            onChanged: (isCheked) {
             ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isCheked);
         
            },
          ),
          SwitchListWidget(
              value: activeFilters[Filter.vegetarian]!,
            title: 'Vegetarian',
            subtitile: 'Only include Vegetarian meals.',
            onChanged: (isCheked) {
                ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isCheked);
         
            },
          ),
          SwitchListWidget(
              value: activeFilters[Filter.vegan]!,
            title: 'Vegan-free',
            subtitile: 'Only include Vegan meals.',
            onChanged: (isCheked) {
                ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isCheked);
         
            },
          ),
        ],
      ),
    );
  }
}
