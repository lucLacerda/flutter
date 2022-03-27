void main() {
  Alunos aluno1 = Alunos(nome: "Lucas", nota: 15);
  
  aluno1.apresentacao();
  aluno1.avaliacaoProva();
  
}

class Alunos{
   
  Alunos({
    required this.nome,
    required this.nota,
  });
  
  String nome;
  double nota;
  late bool aprovado;
  
  void apresentacao() {
    print('Aluno $nome, com nota $nota');
  }
  
  bool validacao() {
    if(nota > 10 || nota < 0) {
      return false;
    } else {
      return true;
    }
  }
  
  void avaliacaoProva() {
    if (validacao() == true) {
      if(nota >= 6 && nota <= 10){
        print('Soldado aprovado');
      } else {
        print('Soldado abatido');
      }
    } else {
      print("Nota inválida");
    }
  }

}
