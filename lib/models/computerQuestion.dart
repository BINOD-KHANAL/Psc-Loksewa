
class ComputerQuestion{

  String question;
  String answer;

  ComputerQuestion({
    required this.question,required this.answer
  });

  factory ComputerQuestion.fromMap(Map<String, dynamic> map){

    return ComputerQuestion(

        question: map['question'],
        answer:map['question'] );

  }


}