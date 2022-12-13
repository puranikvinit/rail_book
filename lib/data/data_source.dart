import 'package:rail_book/data/seat_model.dart';

class SeatDataSource {
  SeatMatrixModel getSeatMatrix() {
    int totalSeats = 56; //Complete Control in the backend
    List<SeatModel> allSeats = List.empty(
      growable: true,
    );
    allSeats.add(SeatModel(
      seatNo: 0,
      seatBerth: "NULL",
      berthName: "NULL",
    ));

    for (int i = 1; i <= totalSeats; i++) {
      String berth;
      String berthName;
      if (i % 8 == 1 || i % 8 == 4) {
        berth = "L";
        berthName = "Lower";
      } else if (i % 8 == 2 || i % 8 == 5) {
        berth = "M";
        berthName = "Middle";
      } else if (i % 8 == 3 || i % 8 == 6) {
        berth = "U";
        berthName = "Upper";
      } else if (i % 8 == 7) {
        berth = "SL";
        berthName = "Side Lower";
      } else {
        berth = "SU";
        berthName = "Side Upper";
      }

      SeatModel seatModel = SeatModel(
        seatNo: i,
        seatBerth: berth,
        berthName: berthName,
      );
      allSeats.add(seatModel);
    }

    return SeatMatrixModel(
      allSeats: allSeats,
    );
  }
}
