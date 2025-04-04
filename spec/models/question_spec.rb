require 'rails_helper'

RSpec.describe Question, type: :model do

  subject { create(:question) }

  context 'associations' do
    it { is_expected.to belong_to(:quiz) }
    it { is_expected.to have_many(:options).dependent(:destroy) }
    it { is_expected.to have_many(:attempted_answers).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:question) }
    it { is_expected.to validate_length_of(:question).is_at_least(10) }
    it { is_expected.to validate_presence_of(:question_type) }
    it { is_expected.to be_valid }
    
    it 'invalid value for question type' do
      subject.question_type = 'invalid'

      expect(subject).to be_invalid
    end
  end  

  context 'public methods' do
    let(:multi_select_question) { create(:question_with_multiple_select) }

    it 'should return the correct options only' do
      expect(multi_select_question.correct.all(&:correct)).to be_truthy
    end
  end
end
