

import 'package:bingo_star_app/src/models/bolo.dart';
import 'package:bingo_star_app/src/services/provider_list_number.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CajaCarton extends StatefulWidget {
  final Bolo boloItem;

  const CajaCarton({Key key, this.boloItem}) : super(key: key);

  @override
  _CajaCartonState createState() => _CajaCartonState();
}

class _CajaCartonState extends State<CajaCarton>
    with SingleTickerProviderStateMixin {
  //Animation
  AnimationController controller;
  // Animation <double>valoranimaion;
  double sizeBoxBolo = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
    // valoranimaion = Tween<double>(begin: 0.0, end: 55).animate(controller);
    // controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerBolo = Provider.of<NotifierBolo>(context, listen: false);


    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: MaterialButton(
          elevation: 2,
          padding: EdgeInsets.zero,
          color: widget.boloItem.selected ? Colors.orange : Colors.white,
          onPressed: () {
            providerBolo.cambio(widget.boloItem.index);
            verificar(providerBolo);
          },
          child: LayoutBuilder(builder: (_, constraint) {
            return Stack(
              fit: StackFit.expand, 
              children: [
              widget.boloItem.falta
                  ? AnimatedBuilder(
                      animation: controller,
                      builder: (_, widget) {
                        return animacionBolo(constraint);
                      })
                  : SizedBox(),
              Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                          Text(
                              ' ${widget.boloItem.numero}' ,
                              style: TextStyle(
                                fontSize: 20,
                                color: widget.boloItem.selected ? Colors.white : Colors.black,
                              ),
                            ),
                ],
              ),
            ]
            );
          }),
        ),
      ),
    );
  }

  Center animacionBolo(BoxConstraints box) {
    controller.repeat();
    // print('valor de controller : ' + controller.value.toString());
    // print('valor de TWEEN : ' + valoranimaion.value.toString());
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.orange[300],
        ),
        height: (box.maxHeight - 5) * controller.value,
        width: (box.maxWidth - 5) * controller.value,
      ),
    );
  }

  void verificar(NotifierBolo notificador) {
    if (widget.boloItem.falta) {
      widget.boloItem.falta = false;
      print('Bingo');
    }else{

    
    int cant = 0;
    int cantFila1 = 0;

    int fila = widget.boloItem.index[1];
    int columna = widget.boloItem.index[0];

    //Revisar ->
    int contadorY = 0;
    if (fila == columna) {
      for (var i = 0; i < 5; i++) {
        if (notificador.listaBolos[i][i].selected) {
          contadorY++;
        }
      }
      //Si hay 3 bolos seleccionados
      if (contadorY == 3) {
        int veriFila = 0;
        int veriColumna = 0;
        for (int i = 0; i < 5; i++) {
          Bolo boloItem = notificador.listaBolos[i][i];
          if (boloItem.falta == true) {
            //Fila
            for (int i = 0; i < 5; i++) {
              if (notificador.listaBolos[i][boloItem.index[1]].selected) {
                veriFila++;
              }
            }
            //Columna
            for (int i = 0; i < 5; i++) {
              if (notificador.listaBolos[boloItem.index[0]][i].selected) {
                veriColumna++;
              }
            }
            //Si ese bolo que esta en True, en la columna o fila tiene 4 Selected se mantiene en True
            if (veriFila == 4 || veriColumna == 4) {
              boloItem.falta = true;
            } else {
              boloItem.falta = false;
            }
          }
        }
      }
      //Si hay 4 ponemos el que falta en True
      if (contadorY == 4) {
        for (int i = 0; i < 5; i++) {
          if (notificador.listaBolos[i][i].selected == false) {
            notificador.listaBolos[i][i].falta = true;
          }
        }
      }
    }

    int contadorX = 0;
    //Verificamos si esta en X
    if ((fila + columna) == 4) {
      for (int i = 0; i < 5; i++) {
        if (notificador.listaBolos[i][4 - i].selected) {
          contadorX++;
        }
      }

      if (contadorX == 3) {
        int veriFila = 0;
        int veriColumna = 0;
        for (int i = 0; i < 5; i++) {
          Bolo boloItem = notificador.listaBolos[i][4 - i];

          if (boloItem.falta == true) {
            //Fila
            for (int i = 0; i < 5; i++) {
              if (notificador.listaBolos[i][boloItem.index[1]].selected) {
                veriFila++;
              }
            }
            //Columna
            for (int i = 0; i < 5; i++) {
              if (notificador.listaBolos[boloItem.index[0]][i].selected) {
                veriColumna++;
              }
            }
            if (veriFila == 4 || veriColumna == 4) {
              notificador.listaBolos[i][4 - i].falta = true;
            } else {
              notificador.listaBolos[i][4 - i].falta = false;
            }
          }
        }
      }

      if (contadorX == 4) {
        for (int i = 0; i < 5; i++) {
          if (notificador.listaBolos[i][4 - i].selected == false) {
            notificador.listaBolos[i][4 - i].falta = true;
          }
        }
      }
    }

    //VALIDACION DE FILAS
    for (int i = 0; i < 5; i++) {
      if (notificador.listaBolos[i][fila].selected) {
        cantFila1++;
      }
    }

    if (cantFila1 == 3) {
      for (int i = 0; i < 5; i++) {
        Bolo boloItem = notificador.listaBolos[i][fila];
        if (boloItem.falta == true) {
          //Si esta en X
          if (boloItem.index[0] + boloItem.index[1] == 4) {
            int contador = 0;
            int contadorColumn = 0;
            // Contar si hay un bolo activo en forma de ->
            for (int i = 0; i < 5; i++) {
              if (notificador.listaBolos[i][4 - i].selected) {
                contador++;
              }
            }
            // Contar si hay un bolo en la columna
            for (int i = 0; i < 5; i++) {
              if (notificador.listaBolos[boloItem.index[0]][i].selected) {
                contadorColumn++;
              }
            }
            if (contador == 4 || contadorColumn == 4) {
              boloItem.falta = true;
            } else {
              boloItem.falta = false;
            }
          }
          //Si hay un bolo activo en <-
          else if (boloItem.index[0] == boloItem.index[1]) {
            int contarVuelta = 0;
            int contarColumna = 0;
            //VALIDAR EN Y
            for (int i = 0; i < 5; i++) {
              if (notificador.listaBolos[i][i].selected) {
                contarVuelta++;
              }
            }
            for (int i = 0; i < 5; i++) {
              if (notificador.listaBolos[boloItem.index[0]][i].selected) {
                contarColumna++;
              }
            }

            if (contarVuelta == 4 || contarColumna == 4) {
              boloItem.falta = true;
            } else {
              boloItem.falta = false;
            }
          } else {
            print('Parpadeando : ${boloItem.numero}');
            int contador = 0;
            for (Bolo item in notificador.listaBolos[boloItem.index[0]]) {
              if (item.selected) {
                contador++;
              }
            }
            if (contador == 4) {
              notificador.listaBolos[i][fila].falta = true;
            } else {
              notificador.listaBolos[i][fila].falta = false;
            }
          }
        }
      }
    }

    if (cantFila1 == 4) {
      for (int i = 0; i < 5; i++) {
        if (notificador.listaBolos[i][fila].selected == false) {
          notificador.listaBolos[i][fila].falta = true;
        }
      }
    }

    //VALIDAMOS COLUMNAS
    for (Bolo item in notificador.listaBolos[widget.boloItem.index[0]]) {
      if (item.selected == true) {
        cant++;
      }
    }

    if (cant == 3) {
      for (Bolo item in notificador.listaBolos[widget.boloItem.index[0]]) {
        if (item.falta == true) {
          if (item.index[0] + item.index[1] == 4) {
            int contador = 0;
            int contadorFila = 0;
            //Verificamos en X
            for (int i = 0; i < 5; i++) {
              if (notificador.listaBolos[i][4 - i].selected) {
                contador++;
              }
            }
            //verificamos en FILA
            for (int i = 0; i < 5; i++) {
              if (notificador.listaBolos[i][item.index[1]].selected) {
                contadorFila++;
              }
            }

            if (contador == 4 || contadorFila == 4) {
              item.falta = true;
            } else {
              item.falta = false;
            }
          } else if (item.index[0] == item.index[1]) {
            int contarVuelta = 0;
            //VALIDAR EN Y
            for (int i = 0; i < 5; i++) {
              if (notificador.listaBolos[i][i].selected) {
                contarVuelta++;
              }
            }
            if (contarVuelta == 4) {
              item.falta = true;
            } else {
              item.falta = false;
            }
          } else {
            int contador = 0;
            for (int i = 0; i < 5; i++) {
              Bolo boloItem = notificador.listaBolos[i][item.index[1]];
              if (boloItem.selected) {
                contador++;
              }
            }
            if (contador == 4) {
              item.falta = true;
            } else {
              item.falta = false;
            }
          }
          print('El que faltaba es ${item.numero}');
        }
      }
    }



    if (cant == 4) {
      print('Falta 1');
      for (Bolo item in notificador.listaBolos[widget.boloItem.index[0]]) {
        if (item.selected == false) {
          item.falta = true;
          print('El que falta es ${item.numero}');
        }
      }
    }
    }
  }
}
