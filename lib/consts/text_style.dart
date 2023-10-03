import 'package:flutter/material.dart';
import 'package:soundfunction/consts/colors.dart';

const bold = "bold";
const regular = "regular";
ourStyle({family = "regular", double? size = 14, color = whiteColor}) {
  return const TextStyle(
    fontSize: 18,
    color: whiteColor,
    fontFamily: "bold",
  );
}
