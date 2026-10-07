class ReviewModel {
  String namaPembeli;
  int rating; // jumlah bintang 1-5
  String komentar;

  ReviewModel({
    required this.namaPembeli,
    required this.rating,
    required this.komentar,
  });
}
