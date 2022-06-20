import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';

class ExpansionPanelListWidget extends StatefulWidget {
  const ExpansionPanelListWidget({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelListWidget> createState() =>
      _ExpansionPanelListWidgetState();
}

class _ExpansionPanelListWidgetState extends State<ExpansionPanelListWidget> {
  List<bool> _isVisible = List.filled(3, false);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ExpansionPanelList(
                animationDuration: Duration(seconds: 1),
                elevation: 1,
                expandedHeaderPadding: EdgeInsets.all(10),
                dividerColor: accentColor,
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isVisible) {
                      return Text(
                        'Description of the study',
                        style: TextStyle(
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                    body: Text(
                      'Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen.', //TODO: hier Studienbeschreibung einfügen
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      textAlign: TextAlign.justify,
                    ),
                    isExpanded: _isVisible[0],
                    canTapOnHeader: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (context, isVisible) {
                      return Text(
                        'Contact person',
                        style: TextStyle(
                            height: 2.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15.0),
                        textAlign: TextAlign.center,
                      );
                    },
                    body: Text(
                      'Name: \n' +
                          'Universität:\n' +
                          'Kontakt:', //TODO: hier Kontaktperson einfügen
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      textAlign: TextAlign.center,
                    ),
                    isExpanded: _isVisible[1],
                    canTapOnHeader: true,
                  ),
                ],
                expansionCallback: (int index, isVisible) =>
                    setState(() => _isVisible[index] = !isVisible),
              ),
            ]));
  }
}
