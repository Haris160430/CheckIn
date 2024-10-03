import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../events/pages/events_list.dart';

class LoginController extends GetxController{
  TextEditingController username = TextEditingController();
  TextEditingController passward = TextEditingController();


  sign_in()
  { print(username.text);
  print( passward.text);
  if(username.text.length>6 && passward.text.length>6)
  {
    Get.snackbar("success","Logged in successfuly");
    Get.to(()=>EventsList());
  }
  else{
    Get.snackbar("error","Username or password incorrect");
  }
  }



}