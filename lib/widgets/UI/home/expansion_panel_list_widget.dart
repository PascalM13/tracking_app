import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';

class ExpansionPanelListWidget extends StatefulWidget {
  const ExpansionPanelListWidget({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelListWidget> createState() =>
      _ExpansionPanelListWidgetState();
}

class _ExpansionPanelListWidgetState extends State<ExpansionPanelListWidget> {
  final List<bool> _isVisible = List.filled(3, false);
  final String _studydescription =
      'Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen. Hier Studienbeschreibung einfügen.'; //TODO: hier Studienbeschreibung einfügen
  final String _name =
      'Professor Schlau'; //TODO: hier Name der Kontaktperson einfügen
  final String _university =
      'University of Siegen'; //TODO: hier Universität der Kontaktperson einfügen
  final String _contact =
      'Tel: 01234-56789'; //TODO: hier Konakt der Kontaktperson einfügen

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ExpansionPanelList(
                  animationDuration: const Duration(seconds: 1),
                  elevation: 1,
                  expandedHeaderPadding: const EdgeInsets.all(10),
                  dividerColor: Colors.black45,
                  children: [
                    ExpansionPanel(
                      backgroundColor: secondery,
                      headerBuilder: (context, isVisible) {
                        return const Text(
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
                      body: Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          _studydescription,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14.0),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      isExpanded: _isVisible[0],
                      canTapOnHeader: true,
                    ),
                    ExpansionPanel(
                      backgroundColor: secondery,
                      headerBuilder: (context, isVisible) {
                        return const Text(
                          'Contact person',
                          style: TextStyle(
                              height: 2.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15.0),
                          textAlign: TextAlign.center,
                        );
                      },
                      body: Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Column(
                              children: const [
                                Text(
                                  'Name:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.0),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'University:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.0),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Contact:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.0),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                Text(
                                  _name,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14.0),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  _university,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14.0),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  _contact,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 14.0),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      isExpanded: _isVisible[1],
                      canTapOnHeader: true,
                    ),
                  ],
                  expansionCallback: (int index, isVisible) =>
                      setState(() => _isVisible[index] = !isVisible),
                ),
              ),
            ]));
  }
}
