import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/controller/data/data_controller.dart';
import 'package:meals_app/view/screen/tabs_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double width;

  @override
  void initState() {
    width = 250;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).size.aspectRatio + (kIsWeb ? 0.8 : 1);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              flex: 5,
              child: Image.asset(
                "assets/home_food.png",
                alignment: Alignment.center,
                scale: 2,
              ),
            ),
            const Divider(color: Colors.transparent),
            Text("Meals App",
                textScaler: TextScaler.linear(scale + 1),
                style: GoogleFonts.spiraxTextTheme()
                    .titleLarge
                    ?.copyWith(color: Colors.white)),
            const Divider(color: Colors.transparent),
            Text(
                "Encontre as suas refeições \nfavoritas e gaste pouco no\n processo!",
                textScaler: TextScaler.linear(scale - 0.3),
                textAlign: TextAlign.center,
                style: GoogleFonts.specialEliteTextTheme()
                    .bodyLarge
                    ?.copyWith(color: Colors.white)),
            const Spacer(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: width,
              height: 50,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              padding: EdgeInsets.zero,
              child: ElevatedButton(
                onPressed: () async => await goto(),
                style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                child: width == 250
                    ? const Text("Continuar")
                    : CircularProgressIndicator(
                        backgroundColor:
                            Theme.of(context).colorScheme.onSecondary,
                        strokeWidth: 3,
                      ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  Future<void> goto() async {
    setState(() {
      if (width == 250) {
        width = 50;
      } else {
        width = 250;
      }
    });
    await MealsDataController().setMeals().whenComplete(() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const TabsSceen(),
          ),
          (route) => false);
    });
  }
}
