class Sinav {
  late int? id;
  late String sinavAd;
  late int matD;
  late int matY;
  late int matB;
  late int turD;
  late int turY;
  late int turB;
  late int fenD;
  late int fenY;
  late int fenB;
  late int sosD;
  late int sosY;
  late int sosB;

  Sinav(
      this.id,
      this.sinavAd,
      this.matD,
      this.matY,
      this.matB,
      this.turD,
      this.turY,
      this.turB,
      this.fenD,
      this.fenY,
      this.fenB,
      this.sosD,
      this.sosY,
      this.sosB);

  Sinav.withId(
      this.id,
      this.sinavAd,
      this.matD,
      this.matY,
      this.matB,
      this.turD,
      this.turY,
      this.turB,
      this.fenD,
      this.fenY,
      this.fenB,
      this.sosD,
      this.sosY,
      this.sosB);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "sinavAd": sinavAd,
      "matD": matD,
      "matY": matY,
      "matB": matB,
      "turD": turD,
      "turY": turY,
      "turB": turB,
      "fenD": fenD,
      "fenY": fenY,
      "fenB": fenB,
      "sosD": sosD,
      "sosY": sosY,
      "sosB": sosB
    };
    return map;
  }

  Sinav.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    sinavAd = map["sinavAd"];
    matD = map["matD"];
    matY = map["matY"];
    matB = map["matB"];
    turD = map["turD"];
    turY = map["turY"];
    turB = map["turB"];
    fenD = map["fenD"];
    fenY = map["fenY"];
    fenB = map["fenB"];
    sosD = map["sosD"];
    sosY = map["sosY"];
    sosB = map["sosB"];
  }
}
