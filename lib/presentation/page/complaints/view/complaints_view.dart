import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/page/complaints/view_model/complaints_viewmodel.dart';
import 'package:untitled/presentation/resources/color_manager.dart';
class ComplaintsView extends StatefulWidget {
  const ComplaintsView({Key? key}) : super(key: key);

  @override
  State<ComplaintsView> createState() => _ComplaintsViewState();
}

class _ComplaintsViewState extends State<ComplaintsView> {
  final TextEditingController _descriptionController = TextEditingController();
  void _sendDescription() {
    String description = _descriptionController.text;
    // ارسل الوصف هنا
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              color: ColorManager.hintGrey,
              height: 400,
              child: TextField(

                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'أدخل الوصف هنا',
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: TextButton(
              onPressed: () {
                Provider.of<ComplaintsViewModel>(context,listen: false).setDescription(_descriptionController.text);
                Provider.of<ComplaintsViewModel>(context,listen: false).storeClaim().then((value) =>
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 50,
                          width: 50,
                          child: AlertDialog(
                            // title: Text('تحذير'),
                            content: Text("Success"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // اتخاذ إجراء هنا
                                  Navigator.of(context).pop();
                                },
                                child: Text('موافق'),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                );


              },
              child: Text('save'),
            ),
          ),
        ],
      ),
    );
  }
}
