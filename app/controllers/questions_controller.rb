class QuestionsController < ApplicationController
	def index
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
	end

	def create
		@question = Question.create!(title: params[:question][:title], body: params[:question][:body], resolved: params[:question][:resolved])
		if @question
			flash[:notice] = "Question was saved."
			redirect_to @question
		else
			flash.now[:alert] = "There was an error saving the Question. Please try again."
			render :new
		end
	end

	def new
		@question = Question.new
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		@question.title = params[:question][:title]
		@question.body = params[:question][:body]
		@question.resolved = params[:question][:resolved]

		if @question.save
			flash[:notice] = "Question Updated"
			redirect_to @question
		else
			flash.now[:alert] = "Problem updating Question"
			render :edit
		end	
	end

	def destroy
		@question = Question.find(params[:id])

		if @question.destroy
			flash[:now] = "Question deleted"
			redirect_to questions_path
		else
			flash.now[:alert] = "Problem removing question"
			render :show
		end
	end
end
