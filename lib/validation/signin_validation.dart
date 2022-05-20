import 'package:flutter/cupertino.dart';
import 'package:pub_transport_01/validation/validation_item.dart';
class signinValidation extends ChangeNotifier{
  validationItem _email = validationItem(null, null);
  validationItem _password = validationItem(null, null);
  // Getters
  validationItem get email => _email;
  validationItem get passeord => _password;
  bool get isValid{
    if(  _email.value !=null && passeord.value !=null )
    {
      return true;
    }
    else
    {
      return false;
    }

  }
  // Setters
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


  void SubmitData () {
    print("${_email.value } , ${_password.value }");
  }
}