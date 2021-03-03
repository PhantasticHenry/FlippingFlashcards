class FlashcardSerializer
  include FastJsonapi::ObjectSerializer
  attributes :category, :question, :correct_answer, :incorrect_answers
end
