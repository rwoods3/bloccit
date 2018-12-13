require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
	let(:my_question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_resolve) }

	describe "GET #index" do
		before(:each) { get :index }
		let(:questions) { assigns(:questions) }

		it "returns https status success" do
			expect(response).to have_http_status(:success)
		end

		it "renders the #index view" do
			expect(response).to render_template(:index)
		end

		it "assigns [my_question] to @questions" do
			expect(questions).to eq [my_question]
			expect(questions.count).to eq 1
		end
	end

	describe "GET #show" do
		before(:each) { get :show, params: { id: my_question.id } }

		it "returns https status success" do
			expect(response).to have_http_status(:success)
		end

		it "renders view #show" do
			expect(response).to render_template(:show)
		end

		it "assigns [my_question] to @question" do
			expect(assigns(:question)).to eq my_question
		end
	end

	describe "GET #edit" do
		before(:each) { get :edit, params: { id: my_question.id } }

		it "returns https status success" do
			expect(response).to have_http_status(:success)
		end

		it "renders the #edit view" do
			expect(response).to render_template(:edit)
		end

		it "assigns [my_question] to @question" do
			expect(assigns(:question)).to eq my_question
		end
	end

	describe "PUT #update" do
		let(:new_title) { RandomData.random_sentence }
		let(:new_body) { RandomData.random_paragraph }
		let(:new_resolved) { RandomData.random_resolve }
		before(:each) { put :update, params: { id: my_question.id, question: {title: new_title, body: new_body, resolved: new_resolved} } }

		it "returns https status redirect (redirects to #show)" do
			expect(response).to have_http_status(:redirect)
		end

		it "redirects to #show view" do
			expect(response).to redirect_to(@question)
		end

		it "updates @question with new attributes" do
			question = assigns(:question)
			expect(question.title).to eq new_title
			expect(question.body).to eq new_body
			expect(question.resolved).to eq new_resolved
		end
	end

	describe "GET #new" do
		before(:each) { get :new }

	    it "returns http success" do
	      expect(response).to have_http_status(:success)
	    end

	    it "renders the #new view" do
	      expect(response).to render_template :new
	    end

	    it "instantiates @question" do
	      expect(assigns(:question)).not_to be_nil
	    end
  	end

    describe "POST #create" do
	    it "increases the number of Question by 1" do
	      expect{ post :create, params: { question: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Question,:count).by(1)
	    end

	    it "assigns the new question to @question" do
	      post :create, params: { question: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
	      expect(assigns(:question)).to eq Question.last
	    end

	    it "redirects to the new question" do
	      post :create, params: { question: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
	      expect(response).to redirect_to Question.last
	    end
	end

	describe "DELETE #destroy" do
	 it "deletes the question" do
       delete :destroy, params: { id: my_question.id }
       count = Question.where({id: my_question.id}).size
       expect(count).to eq 0
     end
 
     it "redirects to questions index" do
       delete :destroy, params: { id: my_question.id }
       expect(response).to redirect_to questions_path
     end
	end
end
