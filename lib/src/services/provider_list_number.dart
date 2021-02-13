
import 'package:bingo_star_app/src/models/bolo.dart';
import 'package:bingo_star_app/src/services/loading_bolos.dart';
export 'package:bingo_star_app/src/models/bolo.dart';
import 'package:flutter/cupertino.dart';


class NotifierBolo with ChangeNotifier {

  List<Bolo> bolosBNotifier = [];
  List<Bolo> bolosINotifier = [];
  List<Bolo> bolosNNotifier = [];
  List<Bolo> bolosGNotifier = [];
  List<Bolo> bolosONotifier = [];

  List<List<Bolo>> listaBolos = [];
  
  cargar(){
    bolosBNotifier = <Bolo>[
      for (var i = 0; i < listBolosB.length; i++) 
        Bolo(numero: listBolosB[i], index: [0,i])        
    ];

     bolosINotifier = <Bolo>[
      for (var i = 0; i < listBolosI.length; i++) 
        Bolo(numero: listBolosI[i], index: [1,i])        
    ];

    bolosNNotifier = <Bolo>[
      for (var i = 0; i < listBolosN.length; i++) 
        Bolo(numero: listBolosN[i], index: [2,i])        
    ];

    bolosGNotifier = <Bolo>[
      for (var i = 0; i < listBolosG.length; i++) 
        Bolo(numero: listBolosG[i], index: [3,i])        
    ];

    bolosONotifier = <Bolo>[
      for (var i = 0; i < listBolosO.length; i++) 
        Bolo(numero: listBolosO[i], index: [4,i])        
    ];

  

    listaBolos.add(bolosBNotifier);
    listaBolos.add(bolosINotifier);
    listaBolos.add(bolosNNotifier);
    listaBolos.add(bolosGNotifier);
    listaBolos.add(bolosONotifier);

  }

  cambio(List<int> index){
    int column = index[0];
    int row = index[1];


    listaBolos[column][row].selected = !listaBolos[column][row].selected;
    
    // bolosBNotifier[index].selected = !bolosBNotifier[index].selected;
    notifyListeners();
  }


}
