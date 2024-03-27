import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_bookmark_book.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class BookmarkController extends GetxController with StateMixin{

  var dataBookmarkBook = Rxn<List<DataBookmark>>();
  String idUser = StorageProvider.read(StorageKey.idUser);

  @override
  void onInit() {
    super.onInit();
    getData();
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
      final responseKoleksiBuku = await ApiProvider.instance().get(
          '${Endpoint.bookmark}/$idUser');

      if (responseKoleksiBuku.statusCode == 200) {
        final ResponseBookmarkBook responseKoleksi = ResponseBookmarkBook.fromJson(responseKoleksiBuku.data);

        if (responseKoleksi.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          dataBookmarkBook(responseKoleksi.data!);
          change(null, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final responseData = e.response?.data;
        if (responseData != null) {
          final errorMessage = responseData['Message'] ?? "Unknown error";
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
