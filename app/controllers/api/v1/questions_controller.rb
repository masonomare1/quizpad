module Api
  module V1
    class QuestionsController < ApiController
      before_action :set_quiz, only: %i[index create]
      before_action :set_question, only: %i[show update destroy]
      before_action :authorize_question, only: %i[show update destroy]

      def index
        @questions = @quiz.questions
      end

      def show
      end

      def create
        @question = @quiz.questions.build(question_params)
        authorize @question

        if @question.save
          render :show
        else
          render json: { errors: @question.errors.full_messages }
        end
      end

      def update
        if @question.update(question_params)
          render :show
        else
          render json: { errors: @quiz.errors.full_messages }
        end
      end

      def destroy
        @question.destroy

        render :show
      end

      private

      def authorize_question
        authorize @question
      end

      def set_quiz
        @quiz = policy_scope(Quiz.includes(:questions)).find_by_hashid!(params[:quiz_id])
      end

      def set_question
        @question = Question.find_by_hashid!(params[:id])
      end

      def question_params
        params.permit(:question, :question_type, options_attributes: %i[description answer])
      end
    end
  end
end
