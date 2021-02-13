


//Hago la lista de los 75 bolos de forma aleatoria
import 'package:bingo_star_app/src/function/Aleatorios.dart';
import 'package:bingo_star_app/src/models/bolo.dart';

List<int> listaCompletaBolos  = List.generate(75, (index) => index + 1)
.toList()..shuffle();

//Cargar la lista de la columna B
List<int> listBolosB =  Aletarios().getListaNumerosAleatoriosSinRepetir(
              minimo: 1, 
              maximo: 15, 
              cantNumeros: 5
              );

List<int> listBolosI =  Aletarios().getListaNumerosAleatoriosSinRepetir(
              minimo: 16, 
              maximo: 30, 
              cantNumeros: 5
              );
List<int> listBolosN  =  Aletarios().getListaNumerosAleatoriosSinRepetir(
              minimo: 31, 
              maximo: 45, 
              cantNumeros: 5
              );
List<int> listBolosG  =  Aletarios().getListaNumerosAleatoriosSinRepetir(
              minimo: 46, 
              maximo: 60, 
              cantNumeros: 5
              );
List<int> listBolosO =  Aletarios().getListaNumerosAleatoriosSinRepetir(
              minimo: 61, 
              maximo: 75, 
              cantNumeros: 5
              );

List<Bolo> listB = <Bolo>[
for(int item in listBolosB ) Bolo(numero: item)
];

List<Bolo> listI = <Bolo>[
for(int item in listBolosI ) Bolo(numero: item)
];

List<Bolo> listN = <Bolo>[
for(int item in listBolosN ) Bolo(numero: item)
];

List<Bolo> listG = <Bolo>[
for(int item in listBolosG ) Bolo(numero: item)
];

List<Bolo> listO = <Bolo>[
for(int item in listBolosG ) Bolo(numero: item)
];













// List<String> list = ['one', 'two', 'three', 'four'];
// List<Widget> widgets = list.map((name) => new Text(name)).toList();


