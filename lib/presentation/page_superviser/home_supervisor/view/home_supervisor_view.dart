import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/presentation/page_superviser/home_supervisor/view_model/home_supervisor_viewmodel.dart';
class HomeSupervisorView extends StatefulWidget {
  const HomeSupervisorView({Key? key}) : super(key: key);

  @override
  State<HomeSupervisorView> createState() => _HomeSupervisorViewState();
}

class _HomeSupervisorViewState extends State<HomeSupervisorView> {
  @override
  void initState() {
    Provider.of<HomeSuperVisorViewModel>(context,listen: false).start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container();
  }
}
