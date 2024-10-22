import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/helper_functions/routes.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruit_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';


Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.dashboardView:
      return MaterialPageRoute(builder: (_) => const DashboardView());
case Routes.addProductView:
      return MaterialPageRoute(builder: (_) => const AddProductView());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
