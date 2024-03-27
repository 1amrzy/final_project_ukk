import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: width,
            height: height,
            child: Column(
              children: [
                kontenKoleksiBuku(),
              ],
            )
        ),
      )
    );
  }

  Widget kontenKoleksiBuku() {
    const Color background = Color(0xFF0C1008);
    const Color borderColor = Color(0xFF424242);

    return SizedBox(
      child: Obx((){
        if (controller.dataBookmarkBook.isNull) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.grey,
              valueColor:
              AlwaysStoppedAnimation<Color>(Color(0xFF260534)),
            ),
          );
        } else if (controller.dataBookmarkBook.value!.isEmpty) {
          return Center(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: borderColor,
                    width: 1.3,
                  )
              ),
              child: Center(
                child: Text(
                  'Belum ada koleksi dataKoleksi yang tersimpan',
                  style: GoogleFonts.inriaSans(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        } else {
          return
            SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children:
                    List.generate(
                      controller.dataBookmarkBook.value!.length,
                          (index) {
                        var dataKoleksi = controller.dataBookmarkBook.value![index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: MediaQuery.of(Get.context!).size.width,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5).withOpacity(0.60),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            height: 150,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Gambar di sebelah kiri
                                Flexible(
                                  flex:3,
                                  child: InkWell(
                                    onTap: (){
                                      Get.toNamed(Routes.DETAILBUKU,
                                        parameters: {
                                          'id': (dataKoleksi.bukuID ?? 0).toString(),
                                          'judul': (dataKoleksi.judul!).toString()
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 150,
                                      decoration : BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.05),
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            offset: const Offset(0, 5), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      // Lebar gambar 40% dari layar
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: AspectRatio(
                                          aspectRatio: 2 / 2,
                                          child: Image.network(
                                            dataKoleksi.coverBuku.toString(),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),


                                Flexible(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dataKoleksi.judul!,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF260534),
                                            fontSize: 18.0,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          dataKoleksi.penulis!,
                                          style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 12.0,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "Penulis : ${dataKoleksi.penulis!}",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 12.0,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Flexible(
                                  flex: 1,
                                  child: Center(
                                    child: InkWell(
                                      onTap: (){

                                      },
                                      child: const Icon(
                                        CupertinoIcons.trash_fill,
                                        color: Color(0xFFFF0000),
                                        size: 26,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                )
            );
        }
      },
      ),
    );
  }
}
