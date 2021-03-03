class FlashcardsController < ApplicationController
  before_action :set_flashcard

  def index 
    @flashcards = Flashcard.all
    render json: FlashcardSerializer.new(@flashcards).serialized_json
  end

  def create 
    flashcard = Flashcard.new(flashcard_params)
    if flashcard.save! 
      render json: FlashcardSerializer.new(flashcard).serialized_json
    else 
      render json: {error: "Could not create flashcard"}
    end
  end

  def show 
    if @flashcard 
      render json: FlashcardSerializer.new(@flashcard).serialized_json
    else 
      render json: {error: "Could not find flashcard with id #{params[:id]}"}
    end
  end

  def update

  end

  private 
  def flashcard_params 
    require.params.permit(:category, :question, :correct_answer, :incorrect_answers => [])
  end

  def set_flashcard 
    @flashcard = Flashcard.find_by(id: params[:id])
  end
end
