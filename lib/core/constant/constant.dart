import 'package:flutter/material.dart';
import 'package:tentwenty_test/core/colors/color_palette.dart';
import 'package:tentwenty_test/data/model/tickets_model/tickets_model.dart';

class Constant {
  static const apiKey = 'e71c97afee16a5f04aa05e7e8078b023';
  static const imageUrl = 'https://api.themoviedb.org/3/movie';
  static const networkImage =
      'https://images.pexels.com/photos/163064/play-stone-network-networked-interactive-163064.jpeg?auto=compress&cs=tinysrgb&w=600';

  static List<TicketsModel> tickList = [
    TicketsModel(
      date: '6 March',
      hall: [
        Hall(
            bounce: '2500',
            time: '12:30',
            title: 'Cinetech + hall 1',
            price: '50\$'),
        Hall(
            bounce: '3000',
            time: '1:30',
            title: 'Cinetech + hall 2',
            price: '75\$'),
      ],
    ),
    TicketsModel(
      date: '7 March',
      hall: [
        Hall(
            bounce: '2500',
            time: '12:30',
            title: 'Cinetech + hall 1',
            price: '50\$'),
        Hall(
            bounce: '3000',
            time: '1:30',
            title: 'Cinetech + hall 2',
            price: '75\$'),
      ],
    ),
    TicketsModel(
      date: '8 March',
      hall: [
        Hall(
            bounce: '2700',
            time: '11:30',
            title: 'Cinetech + hall 2',
            price: '50\$'),
        Hall(
            bounce: '800',
            time: '11:30',
            title: 'Cinetech + hall 1',
            price: '50\$'),
      ],
    ),
    TicketsModel(
      date: '9 March',
      hall: [
        Hall(
            bounce: '2700',
            time: '11:30',
            title: 'Cinetech + hall 2',
            price: '50\$'),
        Hall(
            bounce: '800',
            time: '11:30',
            title: 'Cinetech + hall 1',
            price: '50\$'),
      ],
    ),
    TicketsModel(
      date: '10 March',
      hall: [
        Hall(
            bounce: '2700',
            time: '11:30',
            title: 'Cinetech + hall 2',
            price: '50\$'),
        Hall(
            bounce: '800',
            time: '11:30',
            title: 'Cinetech + hall 1',
            price: '50\$'),
      ],
    ),
    TicketsModel(
      date: '11 March',
      hall: [
        Hall(
            bounce: '2700',
            time: '11:30',
            title: 'Cinetech + hall 2',
            price: '50\$'),
        Hall(
            bounce: '800',
            time: '11:30',
            title: 'Cinetech + hall 1',
            price: '50\$'),
      ],
    ),
  ];

  static List<ChairType> chairType = [
    ChairType(color: ColorPalette.amber, title: 'Selected'),
    ChairType(color: ColorPalette.grey, title: 'Not avaliable'),
    ChairType(color: ColorPalette.purple, title: 'VIP (150\$)'),
    ChairType(color: ColorPalette.blue, title: 'Regular (50\$)'),
  ];
}

class ChairType{
  final Color color;
  final String title;
  ChairType({
    required this.color,
    required this.title
  });
}