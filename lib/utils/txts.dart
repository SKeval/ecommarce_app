// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Txts extends StatefulWidget {
  String? title;
  bool isOverflow;
  double size;
  FontWeight weight;
  Color color;

  Txts(
      {super.key,
      this.title,
      this.color = Colors.black,
      this.size = 15,
      this.isOverflow = false,
      this.weight = FontWeight.normal});

  @override
  State<Txts> createState() => _TxtsState();
}

class _TxtsState extends State<Txts> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title ?? "NA",
      overflow:
          widget.isOverflow ? TextOverflow.ellipsis : TextOverflow.visible,
      style: GoogleFonts.lato(
        fontSize: widget.size,
        fontWeight: widget.weight,
        color: widget.color,
      ),
    );
  }
}
