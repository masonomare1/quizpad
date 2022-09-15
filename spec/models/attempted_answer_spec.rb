require 'rails_helper'

RSpec.describe AttemptedAnswer, type: :model do
  
  subject { create(:attempted_answer) }

  context 'associations' do
    it { is_expected.to belong_to(:quiz_attempt) }
    it { is_expected.to belong_to(:question) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to be_valid }
    
    it 'invalid value for status' do
      subject.status = 'invalid'

      expect(subject).to be_invalid
    end
  end

  context 'public methods' do
    it 'should mark the question as resolved' do
      subject.mark_solved(1)

      expect(subject.solved?).to be_truthy
    end
  end
end
