import 'package:bingo_star_app/src/services/provider_list_number.dart';
import 'package:bingo_star_app/src/widgets/caja_carton.dart';
import 'package:bingo_star_app/src/widgets/header_carton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CartonPage extends StatefulWidget {
  CartonPage({Key key}) : super(key: key);

  @override
  _CartonPageState createState() => _CartonPageState();
}

class _CartonPageState extends State<CartonPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    final borderCircular = BorderRadius.circular(10.0);
    const valorPadding = 5.0;

    final providerBolo = Provider.of<NotifierBolo>(context, listen: false);
    providerBolo.bolosBNotifier.isEmpty ? providerBolo.cargar() : null;
    print('Build Carton');
    return Scaffold(
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: borderCircular,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          // stops: [0.5,1],
                            colors: [
                              Colors.lightBlueAccent[400],
                              Colors.orange[700]
                              
                             
                              ]
            ),
               boxShadow: <BoxShadow> [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 5.0, //Para difuminar el color
                      spreadRadius: 2.0, //Si saben que tan distanciado quiere que esten
                      offset: Offset(0, 5.0) //Es para poner la ubicacion de la "sombra"
                    )
                  ],
            ),
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: HeaderCarton()
                ),
                Consumer<NotifierBolo>(builder: (context, notificador, _) {
                  return Expanded(
                    flex: 9,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0,
                          right: valorPadding,
                          left: valorPadding,
                          bottom: valorPadding),
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: borderCircular,
                            border:  Border.all(color: Colors.white, width: 2.5)),
                        child: Row(children: [
                          for (int i = 0; i < notificador.listaBolos.length; i++)
                            Expanded(
                              child: Column(
                                children: [
                                  for (Bolo item in notificador.listaBolos[i])
                                    Expanded(
                                        child: CajaCarton(
                                      boloItem: item,
                                    ))
                                ],
                              ),
                            ),
                        ]),
                      ),
                    ),
                  );
                })
              ],
            )),
      ),
    );
  }
}
