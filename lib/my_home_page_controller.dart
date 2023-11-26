import 'package:get/get.dart';

class MyHomePageController extends GetxController {
  final Rx<int> _peapleCounter = Rx<int>(0);

  int get peapleCounter => _peapleCounter.value;

  set peapleCounter(int value) {
    if (peapleCounter < 20 || peapleCounter > 0) {
      _peapleCounter.value = value;
    }
    _peapleCounter.refresh();
  }
}
