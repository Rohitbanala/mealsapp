import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealTrait extends StatelessWidget {
  const MealTrait({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 17,color: Colors.white,),
        SizedBox(width: 6.w,),
        Text(label,style: const TextStyle(color: Colors.white),),
      ],
    );
  }
}