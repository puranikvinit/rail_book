//KARKALA SRINIVASA VENKATARAMANA
//OM JAI DURGE MAA

import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueNotifier<int> inputValNotifier;
  final ValueNotifier<List<bool>> glowArray;
  const SearchBar({
    required this.inputValNotifier,
    required this.glowArray,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputVal = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(15.0)),
      child: Form(
        key: formKey,
        child: Row(
          children: [
            SizedBox(
              width: 300.0,
              child: TextFormField(
                controller: inputVal,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Enter Seat Number",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 30.0,
                    ),
                    errorStyle: TextStyle(
                      fontSize: 25,
                    )),
                style: const TextStyle(
                  fontSize: 30,
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      int.parse(value) > 32 ||
                      int.parse(value) <= 0) {
                    return "Enter Valid Seat Number!!";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                if (formKey.currentState!.validate()) {
                  inputValNotifier.value = int.parse(inputVal.text);
                  glowArray.value = List.generate(32, (index) => false);
                  glowArray.value[(inputValNotifier.value - 1)] = true;
                  glowArray.notifyListeners();
                }
              },
              child: Container(
                width: 90.0,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Center(
                  child: Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
