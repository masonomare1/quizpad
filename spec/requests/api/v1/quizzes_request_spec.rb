require 'rails_helper'

RSpec.describe "Api::V1::Quizzes", type: :request do
  # initialize test data 
  let!(:quizzes) { create_list(:quiz, 10, status: :published) }
  let!(:quiz_id) { quizzes.first.hashid }

  # Test suite for GET /api/v1/quizzes
  describe 'GET /api/v1/quizzes' do
    let!(:request!) { get '/api/v1/quizzes', as: :json }

    it 'returns quizzes' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  describe 'GET /api/v1/quizzes/:id' do
    let!(:request!) { get "/api/v1/quizzes/#{quiz_id}", as: :json }

    it 'returns quiz information' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(quiz_id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
