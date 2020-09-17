import '../db_provider.dart';

class Field {
  int datafield;
  String name;
  String fatherName;
  String aadharCardNumber;
  String residentialAddress;
  String familyDetails;
  String origin;
  String destination;
  String route;
  String liveStockDetails;
  String monthlyIncome;

  Field(
      {this.datafield,
      this.name,
      this.fatherName,
      this.aadharCardNumber,
      this.residentialAddress,
      this.familyDetails,
      this.origin,
      this.destination,
      this.route,
      this.liveStockDetails,
      this.monthlyIncome});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.Column_Name: name,
      DatabaseProvider.Column_FatherName: fatherName,
      DatabaseProvider.Column_AadharNumber: aadharCardNumber,
      DatabaseProvider.Column_Address: residentialAddress,
      DatabaseProvider.Column_FamilyDetails: familyDetails,
      DatabaseProvider.Column_Origin: origin,
      DatabaseProvider.Column_Destination: destination,
      DatabaseProvider.Column_Route: route,
      DatabaseProvider.Column_LivestockDetails: liveStockDetails,
      DatabaseProvider.Column_MonthlyIncome: monthlyIncome,
    };
    if (datafield != null) {
      map[DatabaseProvider.Column_DataField] = datafield;
    }
    return map;
  }

  Field.fromMap(Map<String, dynamic> map) {
    datafield = map[DatabaseProvider.Column_DataField];
    name = map[DatabaseProvider.Column_Name];
    fatherName = map[DatabaseProvider.Column_FatherName];
    aadharCardNumber = map[DatabaseProvider.Column_AadharNumber];
    residentialAddress = map[DatabaseProvider.Column_Address];
    familyDetails = map[DatabaseProvider.Column_FamilyDetails];
    origin = map[DatabaseProvider.Column_Origin];
    destination = map[DatabaseProvider.Column_Destination];
    route = map[DatabaseProvider.Column_Route];
    liveStockDetails = map[DatabaseProvider.Column_LivestockDetails];
    monthlyIncome = map[DatabaseProvider.Column_MonthlyIncome];
  }
}
