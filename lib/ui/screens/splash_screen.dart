import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyip/ui/controllers/auth_controller.dart';
import 'package:hyip/ui/screens/login_screen.dart';
import 'package:hyip/ui/screens/main_bottom_nav_screen.dart';
import 'package:hyip/ui/utils/assets_path.dart';
import 'package:hyip/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // life cycles

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNexScreen();
  }

  //   methods
  Future<void> _moveToNexScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    final bool isLoggedIn = await AuthController.checkIfUserLoggedIn();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            isLoggedIn ? const MainBottomNavScreen() : const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(child: SvgPicture.asset(AssetsPath.logoSVG, width: 120)),
      ),
    );
  }
}
