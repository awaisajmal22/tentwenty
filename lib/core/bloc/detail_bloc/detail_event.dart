
import 'package:flutter/material.dart';

@immutable 
abstract class DetailEvent{
  
}class GetDetailDataEvent implements DetailEvent{
final BuildContext context;
final String? id;
const GetDetailDataEvent({required this.context,  this.id});
}