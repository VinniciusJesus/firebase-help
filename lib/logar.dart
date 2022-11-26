import 'package:firebase_auth/firebase_auth.dart'; // Essa biblioteca faz o login e cadastro

class LoginComFirebase {
  final _firebaseInstance = FirebaseAuth.instance;

  Future<void> logar(String email, String senha) async {
    try {
      final authentication = await _firebaseInstance.signInWithEmailAndPassword(
          email: email, password: senha);

      // Aqui em baixo vocês irão chamar uma nova página para a Home, o código so chegara nessa parte
      // se o usuário existir e a senha estivar correta

    } on FirebaseAuthException catch (erro) {
      return;
      // O código chegará aqui caso o usuário nao existe ou a senha esteja errada
      // ou algum problema ocorrer no login, vocês podem usar essa variavel "erro"
      // para saber o que aconteceu de errado
    }
  }
}
