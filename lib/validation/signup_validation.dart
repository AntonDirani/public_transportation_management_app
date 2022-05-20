import 'package:flutter/cupertino.dart';
import 'package:pub_transport_01/validation/validation_item.dart';
import 'package:email_validator/email_validator.dart';
class signupValidation extends ChangeNotifier{
  validationItem _name = validationItem(null, null);
  validationItem _email = validationItem(null, null);
  validationItem _password = validationItem(null, null);
  validationItem _confrimPassword = validationItem(null, null);
  validationItem _naionalNumber = validationItem(null, null);
 // Getters
  validationItem get name => _name;
  validationItem get email => _email;
  validationItem get passeord => _password;
  validationItem get confrimPasseord => _confrimPassword;
  validationItem get nationalNumber => _naionalNumber;
  bool get isValid{
    if(_name.value !=null &&  _email.value !=null && passeord.value !=null && _confrimPassword.value !=null && _naionalNumber !=null)
   {
     return true;
   }
    else
      {
        return false;
      }

}
  // Setters
  void changeName (String value )
  {
    if(value.length >= 3)
      {
          _name = validationItem(value,null);
      }
    else
      {
        _name = validationItem(null, "must be 3 char");
      }
    notifyListeners();
  }
  void changeEmail (String value )
  {
    if (value != null) {
      if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
        _email = validationItem(value,null);
      }
      else
        {
          _email = validationItem(null, "must be 3 cccccahar");

        }
    }

    notifyListeners();
  }
  void changePassword (String value )
  {
    if(value.length >= 6)
    {
      _password = validationItem(value,null);
    }
    else
    {
      _password = validationItem(null, "must be 6 char");
    }
    notifyListeners();
  }
  void checkConfrimPassword (String value )
  {
    if(value == _password.value)
    {
      _confrimPassword = validationItem(value,null);
    }
    else
    {
      _confrimPassword = validationItem(null, "Password didn't match");
    }
    notifyListeners();
  }
  void changeNationalnumber (String value )
  {
    if(value.length >= 14)
    {
      _naionalNumber = validationItem(value,null);
    }
    else
    {
      _naionalNumber = validationItem(null, "must be 14 numbers");
    }
    notifyListeners();
  }
  void SubmitData () {
    print("${_name.value} , ${_email.value } , ${_password.value } , ${_confrimPassword.value} , ${_naionalNumber.value}");
}
}