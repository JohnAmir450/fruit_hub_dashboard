import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/widgets/dasahboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardViewBody(),
    );
  }
}