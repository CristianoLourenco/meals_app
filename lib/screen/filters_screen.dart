import 'package:flutter/material.dart';
import 'package:meals_app/data/enum/enum_file.dart';
import 'package:meals_app/widgets/switchlist_widget.dart';
// import 'package:meals_app/screen/tabs_screen.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Map<Filter, bool> currentFilters;

  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool _glutenFreeFilterSet;
  late bool _lactoseFreeFilterSet;
  late bool _veganFilterSet;
  late bool _vegetarianFilterSet;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree] ?? false;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree] ?? false;
    _veganFilterSet = widget.currentFilters[Filter.vegan] ?? false;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian] ?? false;
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
      // PopScope alow only manually back
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          //! Sending information back using navigator
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
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
