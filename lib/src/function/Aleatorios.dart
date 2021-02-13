import 'dart:math';

import 'package:flutter/cupertino.dart';

class Aletarios{


  List<int> getListaNumerosAleatoriosSinRepetir({@required int minimo,@required int maximo,@required int cantNumeros})
  {
          List<int> lista = List(cantNumeros); 
            for (int i = 0; i < cantNumeros; i++) {
              lista[i] = _numeros_Aleatorios_Rango(minimo, maximo);
                for (var j = 0; j < i; j++) {
                  if (lista[j] == lista[i]) {
                    i>0? i--: 0;
                  }
                }
            }
    return lista;
  }
   int _numeros_Aleatorios_Rango(int minimo,int maximo)
  {
    bool repetido = false;
    final aleatorio = Random();
    int numero = aleatorio.nextInt(maximo+1);
     while (repetido != true) {
                if (numero >=minimo && numero<=maximo) {
                  repetido = true;
                }
                else { numero =aleatorio.nextInt(maximo+1); }
              }
              repetido=false;
    return numero;
  }

}