import 'package:flutter_test/flutter_test.dart';
import 'package:testes_unitarios/app/shared/validators/email_validator.dart';



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
