part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextStyles(
            value: "Welcome To ASABA",
            size: 25,
            weight: FontWeight.bold,
            color: Colors.black),
      ),
    );
  }
}
