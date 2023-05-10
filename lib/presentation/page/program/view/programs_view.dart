import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/app/di.dart';
import 'package:untitled/presentation/page/program/view_model/programs_viewmodel.dart';

class ProgramsView extends StatefulWidget {
  @override
  State<ProgramsView> createState() => _ProgramsViewState();
}

class _ProgramsViewState extends State<ProgramsView> {
  ProgramsViewModel programViewModel = instance<ProgramsViewModel>();

  @override
  void initState() {
    Provider.of<ProgramsViewModel>(context,listen: false).start();

    super.initState();
  }
  @override
  void dispose() {
    programViewModel.dispose();
    super.dispose();
  }

  late bool checked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Card(
              elevation: 3,
              child: DataTable(
                columnSpacing: 19,
                columns: const [
                  DataColumn(
                    label: Text("days"),
                  ),
                  DataColumn(
                    label: Text("time to go"),
                  ),
                  DataColumn(label: Text("time to arrive")),
                  DataColumn(
                    label: Text("position"),
                  ),
                  DataColumn(
                    label: Text("check go"),
                  ),
                  DataColumn(
                    label: Text("check back"),
                  ),
                ],
                rows: List.generate(
                Provider.of<ProgramsViewModel>(context).getProgram().length  ,
                        (index) {
                      final x = Provider.of<ProgramsViewModel>(context).getProgram()[index].day;
                      final y = Provider.of<ProgramsViewModel>(context).getProgram()[index].start;
                      final z = Provider.of<ProgramsViewModel>(context).getProgram()[index].end;
                      final w = Provider.of<ProgramsViewModel>(context).getProgram()[index].dataTransferPositions!.name;
                      String? myString = Provider.of<ProgramsViewModel>(context).getProgram()[index].confirmAttendance1;
                      bool myBool = myString == "1" ? true : false;
                      String? myString2 = Provider.of<ProgramsViewModel>(context).getProgram()[index].confirmAttendance2;
                      bool myBool2 = myString2 == "1" ? true : false;
                      final item = Provider.of<ProgramsViewModel>(context).getProgram()[index].confirmAttendance1;
                      bool select;
                      return DataRow(
                        cells: [
                          DataCell(
                            Text(x),
                          ),
                          DataCell(
                            Text(y),
                          ),
                          DataCell(
                            Text(z),
                          ),
                          DataCell(Text(w)),
                          DataCell(
                            Checkbox(
                              value: myBool,
                              onChanged: (bool? value) {
                                Provider.of<ProgramsViewModel>(context,listen: false).setIndex(index);
                                myBool=value ?? false;
                                  Provider.of<ProgramsViewModel>(context,listen: false).confirmStudent(value ?? true);

                              },
                            ),
                          ),
                          DataCell(
                            Checkbox(
                              value: myBool2,
                              onChanged: (bool? value) {
                                setState(() {
                              //    programViewModel.studentdataList[index]
                            //          .confirmAttendance2 =
                                      value!
                                          .toString()
                                          .replaceAll('true', '1')
                                          .replaceAll('false', '0');
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            // ElevatedButton(onPressed: ()
            //     async {
            //       bool check=checked;
            //       Services.sendConfirmAttendence(check);
            //     }, child: Text('save')),
            //
          ],
        ),
      ),
    );
  }

}
AppBar getAppBarProgram()
{
  return  AppBar(
    title: const Text('Student Program'),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () {
              print('object');
            },
            child: Icon(Icons.add)),
      )
    ],
  );
}