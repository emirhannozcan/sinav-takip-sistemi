import 'package:flutter/material.dart';
import 'dart:math';

class Motivation extends StatelessWidget {
  Motivation({Key? key}) : super(key: key);
  late String text;

  int randomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(10);
    return randomNumber;
  }

  String randomText() {
    return motivationLetters[randomNumber()];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          randomText(),
          textAlign: TextAlign.center,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
      ),
      height: 190.0,
      width: MediaQuery.of(context).size.width - 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue,
          image: const DecorationImage(
              image: AssetImage("assets/images/road.jpg"), fit: BoxFit.fill)),
    );
  }

  final motivationLetters = [
    "Önüne çıkana engel dersen takılıp düşersin; basamak dersen bir basamak yükselirsin.",
    "İlerlemeyi, bizi şikayet edenlere borçluyuz. Memnun insanlar hiçbir değişiklik istemezler. Herbert George Wells",
    "Ne istediğini bilen bir insana yol vermek için; Dünya bile kenara çekilir.",
    "Kaybetmekten korktuğun hiçbir savaşı kazanamasın.",
    "Hayatta iki tip insan vardır; kazananlar ve kaybedenler.",
    "Değişim ancak içeriden açılabilen bir kapıdır.",
    "Uyandığımızda değmeyecek bir güne uyanmayalım da, gerisi bir şekilde hallolur.",
    "Sizi korkutan her deyim size güç, cesaret ve güven kazandırır.",
    "Korku ve kaygılarınızdan arınmadığınız sürece istediğiniz gibi bir yaşam süremeyeceksiniz.",
    "Gök kuşağını görmek istiyorsan, yağmura katlanmalısın."
  ];
}
