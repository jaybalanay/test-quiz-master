require 'rails_helper'

RSpec.describe Api::QuestionsController, :type => :controller do
  context "questions controller specs" do
    let(:question) { FactoryGirl.create :question }

    it "should get index of questions" do
      get :index
      expect(response).to be_success
    end

    it "expect if question successfully created" do
      expect{
        post :create, FactoryGirl.attributes_for(:question)
      }.to change(Question, :count).by(1)
    end

    it "expect if question successfully updated with 200 status code" do
      question_params = { answer: "Bar" }
      put :update, id: question.id, question: question_params
      expect(response.status).to eql(200)
    end

  end
end
