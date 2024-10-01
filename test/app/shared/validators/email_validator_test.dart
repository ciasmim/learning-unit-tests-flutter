import 'package:flutter_test/flutter_test.dart';

class EmailValidator {
  String? validate({String? email}) {
    if (email == null || email.isEmpty ) {
      return 'O e-mail é obrigatorio';
    }

    final emailValido = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if(!emailValido.hasMatch(email)){
      return 'O e-mail é invalido';
    } else{
      return 'O e-mail é valido';
    }

    return null;
  }
}

void main() {
  //instancia da emailValidator'
  late EmailValidator emailValidator;

  //cria para todos os testes uma instancia para o email Validator
  setUp(() {
    emailValidator = EmailValidator();
  });

  group('validação do e-mail', () {
    test(
      'deve retornar mensagem de erro caso e-mail seja null',
      () {
        //funcao que validara o email
        final result = emailValidator.validate();
        expect(result, equals('O e-mail é obrigatorio'));
      },
    );

    test(
      'deve retornar mensagem de erro se e-mail for vazio',
      () {
        final result = emailValidator.validate(email: '');
        expect(result, equals('O e-mail é obrigatorio'));
      },
    );

    test(
      'deve retornar mensagem de erro se e-mail for inválido',
      () {
        final result = emailValidator.validate(email: 'teste@gmail.com');
        if (result == 'O email é invalido'){
          expect(result, equals('O e-mail é invalido') );
        }else{
          expect(result, equals('O e-mail é valido') );
        }
        
      },
    );
    test(
      'deve retornar mensagem de erro se e-mail for null',
      () {
        final result = emailValidator.validate(email: 'iascalistro@gmail.com');
        expect(result, isNull);
      },
    );
    
  });
}
