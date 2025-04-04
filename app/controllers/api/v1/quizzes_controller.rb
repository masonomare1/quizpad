module Api
  module V1
    class QuizzesController < ApiController
      before_action :set_quiz, only: %i[show update destroy]
      before_action :authorize_quiz, only: %i[show update destroy]

      def index
        @quizzes = Quiz.published.order(created_at: :desc)
      end

      def show
      end

      def create
        @quiz = Quiz.new(quiz_params)

        if @quiz.save
          render :show
        else
          render json: { errors: @quiz.errors.full_messages }
        end
      end

      def update
        if @quiz.update(quiz_params)
          render :show
        else
          render json: { errors: @quiz.errors.full_messages }
        end
      end

      def destroy
        @quiz.destroy

        render :show
      end

      private

      def authorize_quiz
        authorize @quiz
      end

      def set_quiz
        @quiz = policy_scope(Quiz).find_by_hashid!(params[:id])
      end

      def quiz_params
        params.permit(
          :name,
          :status,
          questions_attributes: [:question, :question_type, options_attributes: [:description, :correct]]
        ).with_defaults(user: current_user)
      end
    end
  end
end
