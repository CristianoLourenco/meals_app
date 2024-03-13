import 'package:flutter/material.dart';
import 'package:meals_app/widgets/switchlist_widget.dart';
// import 'package:meals_app/screen/tabs_screen.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _veganFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;

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
      body: Column(
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
            value: _vegetarianFreeFilterSet,
            title: 'Vegetarian',
            subtitile: 'Only include Vegetarian meals.',
            onChanged: (isCheked) {
              setState(() {
                _vegetarianFreeFilterSet = isCheked;
              });
            },
          ),
          SwitchListWidget(
            value: _veganFreeFilterSet,
            title: 'Vegan-free',
            subtitile: 'Only include Vegan meals.',
            onChanged: (isCheked) {
              setState(() {
                _veganFreeFilterSet = isCheked;
              });
            },
          ),
        ],
      ),
    );
  }
}
