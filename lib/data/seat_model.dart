class SeatModel {
  final int? seatNo;
  final String? seatBerth;
  final String? berthName;

  SeatModel({
    required this.seatNo,
    required this.seatBerth,
    required this.berthName,
  });
}

class SeatMatrixModel {
  final List<SeatModel> allSeats;

  SeatMatrixModel({
    required this.allSeats,
  });
}
