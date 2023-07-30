import 'package:ecommarce_app/screens/auth/login.dart';
import 'package:ecommarce_app/screens/auth/registration.dart';
import 'package:ecommarce_app/utils/showmsg.dart';

//Letter Use Only
bool isLetter(String ans, String identifier) {
  bool isvalid = true;

  for (var i = 0; i < ans.length; i++) {
    var char = ans.codeUnitAt(i);
    if (!((char >= 65 && char <= 90) || (char >= 97 && char <= 122))) {
      showMsg("$identifier should use Letter Only");
      isvalid = false;
      break;
    }
  }
  return isvalid;
}

bool isNumber(String ans, String identifier) {
  bool isvalid = true;

  for (var i = 0; i < ans.length; i++) {
    var char = ans.codeUnitAt(i);
    if (!(char >= 48 && char <= 57)) {
      showMsg("$identifier should use Number Only");
      isvalid = false;
      break;
    }
  }
  return isvalid;
}

bool validation(String value, valuetype? type, String identifier,
    [Loginvalue? logval]) {
  bool isvalid = true;
  String regMail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  String regPassword =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  if (value.isEmpty) {
    showMsg("$identifier should not be empty");
    isvalid = false;
    return isvalid;
  }
  switch (type ?? logval) {
    //first name
    case valuetype.fname:
      isLetter(value, identifier) ? isvalid = true : isvalid = false;
    // if (!RegExp(regName).hasMatch(value)) {
    //   showMsg("First Name should use Letter Only");
    //   isvalid = false;
    // }

    //last name
    case valuetype.lname:
      isLetter(value, identifier) ? isvalid = true : isvalid = false;

    //email
    case valuetype.email:
      if (!RegExp(regMail).hasMatch(value)) {
        showMsg("Email should contain '@' and '.'");
        isvalid = false;
      }

    //user name
    case valuetype.username:
      if (value.contains(' ')) {
        isvalid = false;
        showMsg("Username should not use Space");
      }

    //number
    case valuetype.number:
      if (value.length > 3) {
        showMsg("Number should use 3 number Only");
        isvalid = false;
      }
      isNumber(value, identifier) ? isvalid = true : isvalid = false;

    //street
    case valuetype.street:
      isLetter(value, identifier) ? isvalid = true : isvalid = false;

    //city
    case valuetype.city:
      isLetter(value, identifier) ? isvalid = true : isvalid = false;

    //zipcode
    case valuetype.zipcode:
      if (value.length > 6) {
        showMsg("Zipcode should use 6 number Only");
        isvalid = false;
      }
      isNumber(value, identifier) ? isvalid = true : isvalid = false;

    //password
    case valuetype.password:
      if (value.length < 8) {
        showMsg("password should use 8 number Only");
        isvalid = false;
      }
      if (!RegExp(regPassword).hasMatch(value)) {
        showMsg(
            "Password Should contain at least One upper case, One lower case, One digit, One Special character, 8 characters in length");
        isvalid = false;
      }

    //phone
    case valuetype.phone:
      isNumber(value, identifier) ? isvalid = true : isvalid = false;
      if (value.length != 10) {
        showMsg("password should be of 10 number");
        isvalid = false;
      }
      break;

    case Loginvalue.username:
      if (!RegExp(regMail).hasMatch(value)) {
        showMsg("Username should contain '@' and '.'");
        isvalid = false;
      }
      break;

    case Loginvalue.password:
      if (value.length < 8) {
        showMsg("password should use 8 number Only");
        isvalid = false;
      }
      if (!RegExp(regPassword).hasMatch(value)) {
        showMsg(
            "Password Should contain at least One upper case, One lower case, One digit, One Special character, 8 characters in length");
        isvalid = false;
      }
      break;

    default:
  }
  return isvalid;
}
