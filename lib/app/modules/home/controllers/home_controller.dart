import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/book/controllers/book_controller.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/book/views/book_view.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/login/views/login_view.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_book_new.dart';
import '../../../data/model/response_popular_book.dart';
import '../../../data/provider/api_provider.dart';

class HomeController extends GetxController with StateMixin {
  var tabIndex = 0;
  var newBooks = Rxn<List<DataBookNew>>();
  var popularBooks = Rxn<List<DataPopularBook>>();


  void changeTabIndex(int index){
    tabIndex = index;
    update();
  }

  @override
  void onInit() {
    getData();
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
  Future<void> getData() async {
    change(null, status: RxStatus.loading());

    try {
      final responseNew = await ApiProvider.instance().get(Endpoint.bukuNew);
      final responsePopular = await ApiProvider.instance().get(Endpoint.bukuPopular);

      if (responseNew.statusCode == 200 && responsePopular.statusCode == 200) {
        final ResponseBookNew responseBukuNew = ResponseBookNew.fromJson(responseNew.data);
        final ResponsePopularBook responseBukuPopular = ResponsePopularBook.fromJson(responsePopular.data);

        if (responseBukuNew.data!.isEmpty && responseBukuPopular.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          newBooks(responseBukuNew.data!);
          popularBooks(responseBukuPopular.data!);
          change(null, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final responseData = e.response?.data;
        if (responseData != null) {
          final errorMessage = responseData['message'] ?? "Unknown error";
          change(null, status: RxStatus.error(errorMessage));
        }
      } else {
        change(null, status: RxStatus.error(e.message));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}

