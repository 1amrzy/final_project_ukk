import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

class HomeController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  
  void buku(){
    Get.toNamed(Routes.BOOK);
}

  void peminjaman(){
    Get.toNamed(Routes.PEMINJAMAN);
  }
}
