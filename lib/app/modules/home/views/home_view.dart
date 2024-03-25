import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/component/customImageCarousel.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/component/customSlide.dart';
import '../../../data/model/response_all_book.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: false,
          expandedHeight: 300.0,
          flexibleSpace: const FlexibleSpaceBar(
            background: CustomImageCarousel(
            ),
          ),
        ),
        SliverAppBar(
          backgroundColor: Colors.white,
          pinned: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.search,color: Color(0xFF6F6F6F)),
                      fillColor: Color(0xFFB6B3B3).withOpacity(0.4),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFB6B3B3), width: 2.0),
                        borderRadius: BorderRadius.circular(30.30),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFB6B3B3), width: 2.0),
                          borderRadius: BorderRadius.circular(30.30)),
                      hintText: 'What do you want?',
                      hintStyle: TextStyle(
                          fontFamily: 'Poppins', color: Color(0xFF6F6F6F))),
                ),
              )),
          // flexibleSpace: const SearchBar(),
        ),
        SliverToBoxAdapter(
          child: customSlide(
            context: Get.context!,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: kontenBukuTerbaru(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: kontenBukuPopular(),
          ),
        ),SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: kontenSemuaBuku(),
          ),
        ),
      ],
    ));
  }
  Widget kontenBukuPopular(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        AutoSizeText(
          "Most Popular",
          minFontSize: 15,
          maxLines: 1,
          maxFontSize: 25,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        GetBuilder<HomeController>(
          builder: (controller) {
            if (controller.popularBooks.isNull) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA1818)),
                ),
              );
            } else if (controller.popularBooks.value!.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA1818)),
                ),
              );
            } else {
              return SizedBox(
                height: 240,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.popularBooks.value!.length,
                    itemBuilder: (context, index) {
                      var buku = controller.popularBooks.value![index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.DETAILBUKU,
                              parameters: {
                                'id': (buku.bukuID ?? 0).toString(),
                                'judul': (buku.judul!).toString()
                              },
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SizedBox(
                                  height: 175,
                                  child: AspectRatio(
                                    aspectRatio: 5 / 6,
                                    child: Image.network(
                                      buku.coverBuku.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              FittedBox(
                                child: Text(
                                  buku.judul!,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 14.0
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              FittedBox(
                                child: Text(
                                  "Penulis : ${buku.penulis!}",
                                  maxLines: 1,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 10.0
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Widget kontenBukuTerbaru(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        AutoSizeText(
          "Recommended",
          minFontSize: 15,
          maxLines: 1,
          maxFontSize: 25,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        GetBuilder<HomeController>(
          builder: (controller) {
            if (controller.newBooks.isNull) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA1818)),
                ),
              );
            } else if (controller.newBooks.value == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA1818)),
                ),
              );
            } else {
              return SizedBox(
                height: 240,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.newBooks.value!.length,
                    itemBuilder: (context, index) {
                      var buku = controller.newBooks.value![index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DETAILBUKU,
                            parameters: {
                              'id': (buku.bukuID ?? 0).toString(),
                              'judul': (buku.judulBuku!).toString()
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 120, // Sesuaikan lebar gambar sesuai kebutuhan Anda
                                height: 175, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
                                child: AspectRatio(
                                  aspectRatio: 4 / 5,
                                  child: Image.network(
                                    buku.coverBuku.toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              FittedBox(
                                child: Text(
                                  buku.judulBuku!,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 14.0
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              FittedBox(
                                child: Text(
                                  "Penulis : ${buku.penerbitBuku!}",
                                  maxLines: 1,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 10.0
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Widget kontenSemuaBuku(){
    return  Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          controller.obx((state) {
            if (controller.allBook! == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA1818)),
                ),
              );
            } else if (controller.allBook.value!.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA1818)),
                ),
              );
            }else{
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.allBook.value!.length,
                itemBuilder: (context, index){
                  var kategori = controller.allBook.value![index].kategoriBuku;
                  var bukuList = controller.allBook.value![index].buku;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            kategori!,
                            style: GoogleFonts.poppins(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: SizedBox(
                          height: 260, // Sesuaikan tinggi container sesuai kebutuhan Anda
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: bukuList!.length,
                            itemBuilder: (context, index) {
                              Buku buku = bukuList[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: InkWell(
                                  onTap: (){
                                    Get.toNamed(Routes.DETAILBUKU,
                                      parameters: {
                                        'id': (buku.bukuID ?? 0).toString(),
                                        'judul': (buku.judul!).toString()
                                      },
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            height: 175,
                                            child: AspectRatio(
                                              aspectRatio: 4 / 5,
                                              child: Image.network(
                                                buku.coverBuku.toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                            left: 0,
                                            bottom: 0,
                                            right: 0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black.withOpacity(0.80)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      FittedBox(
                                        child: Text(
                                          buku.judul!,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 14.0
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),

                                      const SizedBox(height: 4),

                                      FittedBox(
                                        child: Text(
                                          "Penulis : ${buku.penulis!}",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey,
                                              fontSize: 10.0
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),

                                      const SizedBox(height: 4),

                                      FittedBox(
                                        child: Text(
                                          "Penerbit : ${buku.penerbit!}",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey,
                                              fontSize: 10.0
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),

                                      const SizedBox(height: 5),

                                      FittedBox(
                                        child: Text(
                                          "${buku.jumlahHalaman!} Halaman",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey,
                                              fontSize: 10.0
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }
          )
        ],
      ),
    );
  }
}
