import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_detail_book.dart';
import '../../../data/provider/api_provider.dart';

class DetailbukuController extends GetxController with StateMixin {

  var detailBuku = Rxn<DataDetailBook>();
  final id = Get.parameters['id'];

  @override
  void onInit() {
    super.onInit();
    getDataDetailBuku(id);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getDataDetailBuku(String? idBuku) async {
    change(null, status: RxStatus.loading());

    try {
      final responseDetail = await ApiProvider.instance().get(
          '${Endpoint.detailBuku}/$idBuku');

      if (responseDetail.statusCode == 200) {
        final ResponseDetailBook responseDetailBuku = ResponseDetailBook.fromJson(responseDetail.data);

        if (responseDetailBuku.data == null) {
          change(null, status: RxStatus.empty());
        } else {
          detailBuku(responseDetailBuku.data);
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
