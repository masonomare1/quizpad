class QuizPointsCalculatorService
  attr_reader :quiz_attempt, :question, :selected

  def self.call(quiz_attempt, question, selected)
    self.new(quiz_attempt, question, selected).call
  end

  def initialize(quiz_attempt, question, selected)
    @quiz_attempt = quiz_attempt
    @question = question
    @selected = selected
  end

  def call
    case question.question_type.to_sym

    when :single_select
      current_answer.mark_solved(calculate_for_single_select)

    when :multi_select
      current_answer.mark_solved(calculate_for_multi_select)
    end
  end

  def current_answer
    quiz_attempt.attempted_answers.pending.find_by(question_id: question.id)
  end

  def calculate_for_single_select
    question.options.correct.hashid == selected[:option_id]&.first ? 1 : 0
  end

  def calculate_for_multi_select
    question.correct.inject(0) do |sum, option|
      selected.dig(:option_id).include?(option.id.to_s) ? sum + correctness_weight : sum - incorrectness_weight
    end
  end

  def correctness_weight
    1 / question.correct.count.to_f
  end

  def incorrectness_weight
    1 / (question.options.count - question.correct.count).to_f
  end
end
