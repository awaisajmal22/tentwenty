import 'package:flutter/material.dart';
import 'package:tentwenty_test/config/router/routes.dart';
import 'package:tentwenty_test/data/detail_model/detail_model.dart';
import 'package:tentwenty_test/data/model/watch_res_model/watch_res_model.dart';
import 'package:tentwenty_test/screens/dashboard/dashboard_screen.dart';
import 'package:tentwenty_test/screens/detail/detail_screen.dart';
import 'package:tentwenty_test/screens/search/search_screen.dart';
import 'package:tentwenty_test/screens/select_seat/select_seat_screen.dart';
import 'package:tentwenty_test/screens/tickets/component/video_player.dart';
import 'package:tentwenty_test/screens/tickets/tickets_screen.dart';

class Pages {
  static Route<dynamic> onGeneratingRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dashboard:
        return MaterialPageRoute(builder: (context) => DashboardScreen());
      case Routes.search:
        return MaterialPageRoute(builder: (context){ 
         
          return const SearchScreen();});
      case Routes.ticket:
        return MaterialPageRoute(builder: (context) {
          DetailModel model = settings.arguments as DetailModel;
          return TicketsScreen(
            model: model,
          );
        });
      case Routes.selectseat:
        return MaterialPageRoute(builder: (context) {
          DetailModel model = settings.arguments as DetailModel;
          return SelectSeatScreen(
            model: model,
          );
        });
      case Routes.detail:
        return MaterialPageRoute(builder: (context) {
          String id = settings.arguments as String;
          return DetailScreen(
            id: id,
          );
        });
      case Routes.videoPlayer:
        return MaterialPageRoute(builder: (context) {
          String url = settings.arguments as String;
          return VideoPlayerScreen(
            videoUrl: url,
          );
        });

      default:
        return _ErroRoute();
    }
  }

  static Route<dynamic> _ErroRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('Error Route'),
        ),
      );
    });
  }
}
