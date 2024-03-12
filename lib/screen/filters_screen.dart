import 'package:flutter/material.dart';
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
          SwitchListTile(
            value: _glutenFreeFilterSet,
            onChanged: (isCheked) {
              setState(() {
                _glutenFreeFilterSet = isCheked;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 32),
          )
        ],
      ),
    );
  }
}
