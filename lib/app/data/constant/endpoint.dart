class Endpoint {
  static const String baseUrlApi =
      "http://127.0.0.1:8000/api/users/";

  static const String register = "${baseUrlApi}registrasi";
  static const String login = "${baseUrlApi}login";
  static const String buku = "${baseUrlApi}buku";
  static const String bukuNew = "${baseUrlApi}buku/new";
  static const String detailBuku = "${baseUrlApi}buku/detail";
  static const String bukuPopular = "${baseUrlApi}popular/buku";
  static const String pinjam = "${baseUrlApi}pinjam";
}