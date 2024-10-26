
import 'package:flutter/material.dart';

@immutable
abstract class WatchEvent{
  
}

class GetWatchDataEvent implements WatchEvent{
final BuildContext context;
const GetWatchDataEvent({required this.context});
}