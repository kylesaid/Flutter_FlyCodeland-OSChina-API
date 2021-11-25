import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shake/shake.dart';

class FindShakePage extends StatefulWidget {
  const FindShakePage({Key? key}) : super(key: key);

  @override
  _FindShakePageState createState() => _FindShakePageState();
}

class _FindShakePageState extends State<FindShakePage> with SingleTickerProviderStateMixin {
  bool isShaked = false;
  int _currentIndex = 0;
  Image _shakeImg = Image.asset(
  'assets/images/shake.png',
  width: 120,
  height: 120,
  );

  late AnimationController mAnimationController;
//提供一个曲线，使动画感觉更流畅
  late CurvedAnimation offsetCurvedAnimation;
//平移动画
  late Animation<double> offsetAnim;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mAnimationController = AnimationController(duration: Duration(seconds: 1), vsync: this);
    offsetCurvedAnimation = new CurvedAnimation( parent: mAnimationController, curve: Curves.easeInToLinear);
    offsetAnim = new Tween(begin: -1.0, end: 1.0).animate(offsetCurvedAnimation);



    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      // Do stuff on phone shake
      print('Shake it');
      mAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shake it'),
      ),
      body: AnimatedBuilder(
        animation: offsetAnim,//添加动画
        builder: (context, _) {
          return Transform.translate(
            offset: Offset(offsetAnim.value,0),// 1,0 水平移动 -- 0,1垂直移动
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _shakeImg,
                  Text('Shake it to get gift.'),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.folder), label: 'GIFT'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'NEWS'),
        ],
        onTap: (index){
          if(!mounted) return;
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
