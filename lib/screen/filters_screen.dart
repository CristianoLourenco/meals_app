import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/enum/enum_file.dart';
import 'package:meals_app/provider/filters_provider.dart';
import 'package:meals_app/widgets/switchlist_widget.dart';
// import 'package:meals_app/screen/tabs_screen.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerStatefulWidget { 

  const FiltersScreen({
    super.key, 
  });

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  late bool _glutenFreeFilterSet;
  late bool _lactoseFreeFilterSet;
  late bool _veganFilterSet;
  late bool _vegetarianFilterSet;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree] ?? false;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree] ?? false;
    _veganFilterSet = activeFilters[Filter.vegan] ?? false;
    _vegetarianFilterSet = activeFilters[Filter.vegetarian] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   drawer: MainDrawer(onSelected: (identifier) {
      //       Navigator.of(context).pop();
      // if (identifier == 'Meals') {
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) => const TabsSceen(),
      //   ));
      // }
      //   }),
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // PopScope alow block manually back
      body: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          ref.read(filtersProvider.notifier).setallFitlers({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return;
        },
        child: Column(
          children: [
            // New Widget
            SwitchListWidget(
              value: _glutenFreeFilterSet,
              title: 'Gluten-free',
              subtitile: 'Only include gluten-free meals.',
              onChanged: (isCheked) {
                setState(() {
                  _glutenFreeFilterSet = isCheked;
                });
              },
            ),
            SwitchListWidget(
              value: _lactoseFreeFilterSet,
              title: 'Lactose-free',
              subtitile: 'Only include Lactose-free meals.',
              onChanged: (isCheked) {
                setState(() {
                  _lactoseFreeFilterSet = isCheked;
                });
              },
            ),
            SwitchListWidget(
              value: _vegetarianFilterSet,
              title: 'Vegetarian',
              subtitile: 'Only include Vegetarian meals.',
              onChanged: (isCheked) {
                setState(() {
                  _vegetarianFilterSet = isCheked;
                });
              },
            ),
            SwitchListWidget(
              value: _veganFilterSet,
              title: 'Vegan-free',
              subtitile: 'Only include Vegan meals.',
              onChanged: (isCheked) {
                setState(() {
                  _veganFilterSet = isCheked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
