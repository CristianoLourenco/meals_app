import 'package:flutter/material.dart'; 


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/home_food.png"),
          Text("Meals App"),
          Text(
              "Encontre as suas refeições \nfavoritas e gaste pouco no\n processo!"),
          ElevatedButton(
            onPressed: () {},
            child: Text("Continuar"),
          ),
        ],
      ),
    );

    // FutureBuilder(
    //   future: MealsDataController().setMeals(),
    //   builder: (context, snapshot) {
    //     return snapshot.connectionState == ConnectionState.done
    //         ? const TabsSceen()
    //         : const HomeScreen();
    //   },
    // );

    //   const Material(
    //   child: Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
  }
}
