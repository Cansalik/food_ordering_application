class Foods
{
  String yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  String yemek_fiyat;

  Foods({
    required this.yemek_id,
    required this.yemek_adi,
    required this.yemek_resim_adi,
    required this.yemek_fiyat});

  factory Foods.fromJson(Map<String, dynamic> json){
    return Foods(
        yemek_id: json['yemek_id'],
        yemek_adi: json["yemek_adi"],
        yemek_resim_adi: json["yemek_resim_adi"],
        yemek_fiyat: json["yemek_fiyat"]);
  }

}