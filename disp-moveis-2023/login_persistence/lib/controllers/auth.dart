import '../models/pessoa_model.dart';

class LoginController {
  bool login(User user) {
    // Verificar se o usuário existe no sistema
    if (user.username == 'user@example.com' && user.password == '123') {
      return true;
    } else {
      return false;
    }
  }
}
