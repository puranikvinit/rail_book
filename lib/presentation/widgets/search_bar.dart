import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueNotifier<List<bool>> glowArray;

  const SearchBar({
    required this.glowArray,
    Key? key,
  }) : super(key: key);

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final inputVal = TextEditingController();

    return LayoutBuilder(
        builder: (context, constraints) => Container(
              margin: const EdgeInsets.only(
                bottom: 5.0,
                left: 10.0,
                right: 10.0,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Form(
                key: formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.65,
                      child: TextFormField(
                        controller: inputVal,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: "Enter Seat Number",
                            border: InputBorder.none,),
                        validator: (value) {
                          if (value!.isEmpty ||
                              int.parse(value) > glowArray.value.length ||
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
                          int len = glowArray.value.length;
                          glowArray.value =
                              List.generate(len, (index) => false);
                          glowArray.value[(int.parse(inputVal.text) - 1)] =
                              true;
                        }
                      },
                      child: Container(
                        width: constraints.maxWidth * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(
                          child: Text(
                            "Search",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
