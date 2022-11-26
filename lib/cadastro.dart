import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCadastrar {
  final _firebaseInstance = FirebaseAuth.instance;
  final _firestoreInstance = FirebaseFirestore.instance;

  Future<void> cadastrar(
      {required String nome,
      required String email,
      required String senha}) async {
    try {
      // Essa parte realiza o cadastro do usuário
      final addAccount = await _firebaseInstance.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      // Essa parte salva o usuário para listar depois
      await _firestoreInstance
          .collection("users")
          .doc(addAccount.user!.uid)
          .set({
        "id": addAccount.user!.uid,
        "name": nome,
        "email": email,
      });

      // Aqui em baixo vocês irão chamar uma nova página para a Home, o código so chegara nessa parte
      // se o usuário existir e a senha estivar correta

    } on FirebaseAuthException catch (erro) {
      // O código chegará aqui caso o email seja invalido ou a senha muito curta
      // caso algum problema ocorra no cadastro, vocês podem usar essa variavel "erro"
      // para saber o que aconteceu de errado
    }
  }
}
