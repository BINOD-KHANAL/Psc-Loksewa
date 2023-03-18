
class BankQuestion{

  String question;
  String answer;

  BankQuestion({
    required this.question,required this.answer
});

  factory BankQuestion.fromMap(Map<String, dynamic> map){

    return BankQuestion(

        question: map['question'],
        answer:map['question'] );

  }


}