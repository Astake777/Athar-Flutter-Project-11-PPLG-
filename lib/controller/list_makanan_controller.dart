import 'package:fluttertest1/models/makanan_model.dart';
import 'package:fluttertest1/models/review_model.dart';
import 'package:get/get.dart';

class ListMakananController extends GetxController {
  // kita buat data datanya (data contoh, ganti dengan data asli)
  List<MakananModel> listMakanan = [
    MakananModel(
      namaMakanan: "Soto Ayam",
      hargaMakanan: "10.000",
      gambar: "https://o-cdf.oramiland.com/unsafe/cnc-magazine.oramiland.com/parenting/original_images/soto_ayam_bumbu_kuning.jpg",
      desc: "Makanan berkuah kuning bening nan gurih, disajikan lengkap dengan suwiran daging ayam, irisan telur rebus, tauge, seledri, bawang goreng, dan perasan jeruk nipis segar.",
      rating: 5,
      review: [
        ReviewModel(namaPembeli: "Rina", rating: 5, komentar: "Kuahnya segar dan gurih, porsinya pas."),
        ReviewModel(namaPembeli: "Budi", rating: 5, komentar: "Ayamnya banyak, cocok untuk makan siang."),
        ReviewModel(namaPembeli: "Sari", rating: 4, komentar: "Enak, tapi kalau ramai harus antre."),
      ],
    ),
    MakananModel(
      namaMakanan: "Lentog",
      hargaMakanan: "20.000",
      gambar: "https://media.indozone.id/crop/0x0:0x0/images/2026/09/17/1789617596_6aab65bca5789_lentog_tanjung_png.png",
      desc: "Kuliner khas Kudus (Lentog Tanjung) berisi irisan lontong yang disiram kuah santan gurih, lodeh tahu tempe, serta kuah sayur nangka muda (gori), disajikan cantik di atas piring beralas daun pisang.",
      rating: 4,
      review: [
        ReviewModel(namaPembeli: "Dimas", rating: 4, komentar: "Enak dan khas Kudus, cocok untuk sarapan."),
        ReviewModel(namaPembeli: "Ayu", rating: 4, komentar: "Santannya pas, tidak terlalu berat."),
      ],
    ),
    MakananModel(
      namaMakanan: "Pindang Kerbau",
      hargaMakanan: "20.000",
      gambar: "https://cdngnfi2.sgp1.cdn.digitaloceanspaces.com/gnfi/uploads/images/2021/10/0420362021-np.jpg",
      desc: "Nasi dengan siraman kuah olahan kluwek dan santan yang bertekstur agak pekat dengan cita rasa gurih sedikit manis. Makanan ini khas dengan sajian potongan daging kerbau serta campuran daun melinjo di atas alas daun pisang.",
      rating: 4,
      review: [
        ReviewModel(namaPembeli: "Fajar", rating: 4, komentar: "Dagingnya empuk, bumbunya terasa."),
        ReviewModel(namaPembeli: "Nina", rating: 5, komentar: "Kuahnya kaya rempah, pasti beli lagi."),
      ],
    ),
    MakananModel(
      namaMakanan: "Jenang",
      hargaMakanan: "15.000",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiwJ4llazZfm183hLfhCmrHvNqusJ0uH37O65jJAGbdA&s=10",
      desc: "Makanan manis khas berbahan dasar tepung ketan, gula jawa, dan santan. Teksturnya kenyal serta legit mirip dodol dengan warna cokelat pekat.",
      rating: 3,
      review: [
        ReviewModel(namaPembeli: "Wulan", rating: 3, komentar: "Manisnya pas, cocok untuk oleh-oleh."),
        ReviewModel(namaPembeli: "Hendra", rating: 3, komentar: "Teksturnya agak keras, rasanya enak."),
      ],
    ),
    MakananModel(
      namaMakanan: "bolang baling",
      hargaMakanan: "5.000",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShlIIPuBs9f0b7ClpkhefMFWDOsbMZhLVzSHscLG4XWQ&s=10",
      desc: "Kue goreng berbahan dasar adonan tepung terigu dan gula dengan rasa manis gurih. Teksturnya empuk di bagian dalam dan renyah di luar.",
      rating: 4,
      review: [
        ReviewModel(namaPembeli: "Putri", rating: 4, komentar: "Renyah dan murah."),
        ReviewModel(namaPembeli: "Andi", rating: 4, komentar: "Cocok untuk camilan sambil nongkrong."),
      ],
    ),
    // dll
  ];
}
