import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';

class TableActivityWidget extends StatelessWidget {
  const TableActivityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'A',
          ),
        ),
        DataColumn(
          label: Text(
            'T',
          ),
        ),
        DataColumn(
          label: Text(
            'D',
          ),
        ),
        
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('S')),
            DataCell(Text('19')),
            DataCell(Text('19')),
            
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('J')),
            DataCell(Text('43')),
            DataCell(Text('19')),
            
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('W')),
            DataCell(Text('27')),
            DataCell(Text('19')),
            
          ],
        ),
      ],
    );
  }
}