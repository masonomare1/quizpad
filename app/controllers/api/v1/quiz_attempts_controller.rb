module Api
  module V1
    class QuizAttemptsController < ApiController
      before_action :set_quiz, only: %i[index create]
      before_action :set_quiz_attempt, only: %i[create pending_questions show solve]

      def index
        @attempts = @quiz.quiz_attempts
      end

      def show; end

      def create
        @attempt = @quiz.quiz_attempts.build(user: current_user)
        authorize @attempt

        if @quiz_attempt.save
          render :show
        else
          render json: { errors: @quiz_attempt.errors.full_messages }
        end
      end

      def solve
        authorize @attempt
        question = Question.find_by_hashid!(params[:id])

        if question.pending?
          QuizPointsCalculatorService.new(@quiz_attempt, question, attempt_params).call
        else
          render json: { error: I18n.t('quiz.errors.already_solved') }
        end
      end

      private

      def set_quiz
        @quiz = Quiz.published.find_by_hashid!(params[:quiz_id])
      end

      def set_quiz_attempt
        @attempt = QuizAttempt.find_by_hashid!(params[:id])
      end

      def attempt_params
        params.require(:selected).permit(option_id: [])
      end
    end
  end
end
