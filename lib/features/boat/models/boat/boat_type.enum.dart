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
}
