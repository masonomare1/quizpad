require 'rails_helper'

RSpec.describe Quiz, type: :model do

  subject { create(:quiz, status: :draft) }

  before do
    create(:question_with_single_select, quiz: subject)
    create(:question_with_single_select, quiz: subject)
    create(:question_with_multiple_select, quiz: subject)
  end


  context 'associations' do
    it { is_expected.to have_many(:questions).dependent(:destroy) }
    it { is_expected.to have_many(:quiz_attempts).dependent(:destroy) }
    it { is_expected.to belong_to(:user) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to be_valid }
    
    it 'invalid value for status' do
      subject.status = 'invalid'

      expect(subject).to be_invalid
    end
  end  
end
