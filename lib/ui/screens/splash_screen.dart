import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyip/ui/screens/login_screen.dart';
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
  Navigator.pushReplacement(context,
  MaterialPageRoute(builder: (context)=> const LoginScreen())
  );
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ScreenBackground(child:  Center(
        child: SvgPicture.asset(
          AssetsPath.logoSVG,
          width: 120,
        ),
      )),
    );
  }
}
