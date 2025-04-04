require 'rails_helper'

RSpec.describe Option, type: :model do
  subject! { create(:option, question: question, correct: true) }
  let(:question) { create(:question) }

  context 'associations' do
    it { is_expected.to belong_to(:question) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to be_valid }
  end  

  context 'scopes' do
    it 'should return the correct options only' do
      expect(Option.correct.select(&:correct)).to match_array([subject])
    end

    it 'should return options for question' do
      expect(question.options).to match_array(question.options)
    end
  end
end
