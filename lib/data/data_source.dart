//KARKALA SRINIVASA VENKATARAMANA
//OM JAI DURGE MAA

import 'package:rail_book/data/seat_model.dart';

class SeatDataSource {
  SeatMatrixModel getSeatMatrix() {
    List<SeatModel> allSeats = List.empty(
      growable: true,
    );
    allSeats.add(SeatModel(seatNo: 0, seatBerth: "NULL"));
    for (int i = 1; i <= 32; i++) {
      String berth;
      if (i % 8 == 1 || i % 8 == 4) {
        berth = "L";
      } else if (i % 8 == 2 || i % 8 == 5) {
        berth = "M";
      } else if (i % 8 == 3 || i % 8 == 6) {
        berth = "U";
      } else if (i % 8 == 7) {
        berth = "SL";
      } else {
        berth = "SU";
      }

      SeatModel seatModel = SeatModel(
        seatNo: i,
        seatBerth: berth,
      );
      allSeats.add(seatModel);
    }

    

    return SeatMatrixModel(
      allSeats: allSeats,
    );
  }
}
