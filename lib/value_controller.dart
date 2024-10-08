import 'package:get/get.dart';

class ValueController extends GetxController {

  RxString definedValue = ''.obs;

  RxBool isLoading = false.obs;

  Future<void> setValue(String newValue) async {

    isLoading.value = true;
    //update(); // Não precisa mais

    await Future.delayed(const Duration(seconds: 2));

    definedValue.value = newValue;

    isLoading.value = false;
    //update(); // Não precisa mais
  }
}