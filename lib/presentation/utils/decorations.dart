import 'package:auction_app/core/utils/resources.dart';
import 'package:flutter/material.dart';

const inputFocusedBorder = InputDecoration(
  border: InputBorder.none,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorResources.INPUT_BORDER_COLOR,
      width: 2.0,
    ),
  ),
);
