import 'package:get/get.dart';
import 'package:radin/network/api_provider.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(APIProvider(), permanent: true);
  }
}
