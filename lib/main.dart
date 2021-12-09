import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              const Text('Rate the Food',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
              const Text('How was it?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              Lottie.asset('assets/reaction.json',
                  controller: _animationController, onLoaded: (composition) {
                _animationController.duration = composition.duration;
              }),
              const Spacer(),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                ),
                child: Slider(
                    value: progress,
                    activeColor: Colors.black,
                    onChanged: (val) {
                      setState(() {
                        progress = val;
                        _animationController.value = 0.5 + (val / 2);
                      });
                    }),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                      child: Text('That\'s it',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700))))
            ])));
  }
}
