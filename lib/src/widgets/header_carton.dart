import 'package:flutter/material.dart';

class HeaderCarton extends StatelessWidget {
   HeaderCarton({Key key}) : super(key: key);
    final List<String> bingo = ["B", "I", "N", "G", "O"];
    final List<Color> colores = [
      Colors.lightBlue,
      Colors.orange,
      Colors.green,
      Color(0xFFF5E80D),
      Colors.red,
    ];
    final List<Color> coloresBorde = [
      Colors.lightBlueAccent,
      Colors.orangeAccent,
      Colors.greenAccent,
      Colors.yellowAccent,
      Colors.redAccent,
    ];

  @override
  Widget build(BuildContext context) {
    return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        for (int i = 0; i < bingo.length; i++)
                          Expanded(
                              child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0, left: 5.0,top: 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only( 
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0)),
                                    color: colores[i],
                                      border: Border.all(
                                      color: coloresBorde[i],
                                      width: 1.0),
                                  ),
                                child: Center(child: Text('${bingo[i]}',style: TextStyle(color: Colors.white, fontSize: 25.0),)),
                              ),
                            ),
                          ))
                      ],
                    ),
                  );
  }
}