import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/book/controllers/book_controller.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/book/views/book_view.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/login/views/login_view.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index){
    tabIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

    @override
    void dispose() {
      super.dispose();
    }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}

