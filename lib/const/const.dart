import 'package:flutter/material.dart';

String kAppName = 'Wasalli - وصلّي';
const Color kPrimaryColor = Color(0xff065758);
const Color kSecanderyColor = Colors.white;
const Color kPrimaryColorfieldS = Color(0xffE7E0EC);
const Color kPrimaryColorCards = Color.fromARGB(255, 237, 237, 237);
const String kLogo = 'assets/images/Logo.png';
//const String localhost = 'http://10.0.2.2';  LocalHost for android emulator
const String loginEndPoint = 'auth/login';  
const String signupEndPoint = 'auth/signup';  
const String makeOrdersEndPoint = 'orders';  
const String messagesEndPoint = 'messages';  
const String getHistoryEndPoint = 'orders/history';
const String getProfileEndPoint = 'users/profile';

const String availableOrderDeliveryEndPoint = 'orders/';  
const String putOrderInProgressDeliveryEndPoint = 'orders/status/';  
const String inProgressOrderDeliveryEndPoint = 'orders/history';  
const String wattingOrderSenderEndPoint = 'orders/history';
const String inProgressOrderSenderEndPoint = 'orders/history';
const String putOrderInDeliveredDeliveryEndPoint = 'orders/status/';
const String deletOrderEndPoint = 'orders/soft-delete/';
