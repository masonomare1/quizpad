require 'rails_helper'

RSpec.describe QuizAttempt, type: :model do
  
  let(:user) { create(:user) }
  let(:quiz) { create(:quiz_with_questions, user: user) }
  
  subject(:attempt) { create(:quiz_attempt, quiz: quiz, user: user) } 

  context 'associations' do
    it { is_expected.to belong_to(:quiz) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:questions).through(:quiz) }
    it { is_expected.to have_many(:attempted_answers).dependent(:destroy) }
    it { is_expected.to have_many(:attempted_answers).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to be_valid }
    
    it 'invalid value for attempt status' do
      subject.status = 'invalid'

      expect(subject).to be_invalid
    end
  end  

  context 'public methods' do
    let(:multi_select_question) { create(:question_with_multiple_select) }

    it 'should return the correct options only' do
      expect(multi_select_question.correct.all(&:correct)).to be_truthy
    end
  end

  context 'private methods' do
    it 'total points should be equal to number of questions' do
      expect(subject.total_points).to eq(quiz.questions.count)
    end

    it 'answers to be attempted is equal to number of questions' do
      expect(subject.attempted_answers.count).to eq(quiz.questions.count)
    end
  end
end
