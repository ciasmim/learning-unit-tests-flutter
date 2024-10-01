

class EmailValidator {
  String? validate({String? email}) {
    if (email == null || email.isEmpty ) {
      return 'O e-mail é obrigatorio';
    }

    final emailValido = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if(!emailValido.hasMatch(email)){
      return 'O e-mail é invalido';
    } 
    // else{
    //   return 'O e-mail é valido';
    // }

    return null;
  }
}