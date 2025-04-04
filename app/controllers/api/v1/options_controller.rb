module Api
  module V1
    class OptionsController < ApiController
      before_action :set_question, only: %i[index create]
      before_action :set_option, only: %i[show update destroy]
      before_action :authorize_option, only: %i[show update destroy]

      def index
        @options = @question.options
      end

      def show
      end

      def create
        @option = @question.options.build(option_params)

        if @option.save
          render :show
        else
          render json: { errors: @option.errors }
        end
      end

      def update
        if @option.update(option_params)
          render :show
        else
          render json: { errors: @option.errors }
        end
      end

      def destroy
        @option.destroy

        render :show
      end

      private

      def authorize_option
        authorize @option
      end

      def set_question
        @question = Question.find_by_hashid!(params[:question_id])
      end

      def set_option
        @option = Option.find_by_hashid!(params[:id])
      end

      def option_params
        params.permit(:description, :answer)
      end
    end
  end
end
