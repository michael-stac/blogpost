import 'package:flutter/material.dart';



String getGreetingMessage() {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good morning';
  } else if (hour < 17) {
    return 'Good afternoon';
  } else if (hour < 21) {
    return 'Good evening';
  } else {
    return 'Good night';
  }
}



class GreetingIcon  {
  final String greetingMessage;

  GreetingIcon(this.greetingMessage);

  Icon getIconAsset() {
    Color iconColor;
    if (greetingMessage == 'Good morning') {
      iconColor = Colors.yellow; // Morning color
      return Icon(Icons.wb_sunny, color: iconColor); // Assuming 'wb_sunny' is the morning icon
    } else if (greetingMessage == 'Good afternoon') {
      iconColor = Colors.orange; // Afternoon color
      return Icon(Icons.brightness_medium, color: iconColor); // Assuming 'brightness_medium' is the afternoon icon
    } else if (greetingMessage == 'Good evening') {
      iconColor = Colors.blueGrey; // Evening color
      return Icon(Icons.brightness_3, color: iconColor); // Assuming 'brightness_3' is the evening icon
    } else {
      iconColor = Colors.indigo; // Night color
      return Icon(Icons.nights_stay, color: iconColor); // Assuming 'nights_stay' is the night icon
    }
  }



}


