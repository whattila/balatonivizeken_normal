enum BoatType {
  waterSportsEquipment,
  smallBoat,
  licensedBoat,
}

extension BoatTypeName on BoatType {
  String get displayName {
    switch (this) {
      case BoatType.waterSportsEquipment:
        return "Vízi sporteszköz";
      case BoatType.smallBoat:
        return "Kisméretű hajó";
      case BoatType.licensedBoat:
        return "Regisztrált hajó";
      default:
        return "Nem létező hajótípus";
    }
  }

  int get refreshRate {
    switch (this) {
      case BoatType.waterSportsEquipment:
        return 20;
      case BoatType.smallBoat:
        return 15;
      case BoatType.licensedBoat:
        return 10;
      default:
        return 15;
    }
  }
}
