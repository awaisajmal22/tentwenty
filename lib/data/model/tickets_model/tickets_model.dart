class TicketsModel{
  final String date;
  final List<Hall> hall;
  TicketsModel({required this.date,required this.hall});
}

class Hall{
  final String time;
  final String title;
  final String price;
  final String bounce;
  Hall({required this.bounce,required this.price,required this.time,required this.title});
}