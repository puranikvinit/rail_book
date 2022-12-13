//KARKALA SRINIVASA VENKATARAMANA
//OM JAI DURGE MAA

class SeatModel {
  final int? seatNo;
  final String? seatBerth;

  SeatModel({
    required this.seatNo,
    required this.seatBerth,
  });
}

class SeatMatrixModel {
  final List<SeatModel> allSeats;

  SeatMatrixModel({
    required this.allSeats,
  });
}
