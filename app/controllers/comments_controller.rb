class CommentsController < ApplicationController
	def index
	end

	def new
		@comment = Comment.new(:author => "", :content => "")
		render :partial => 'new'
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.prefix_options[:post_id] = params[:post_id]
		@comment.save
		redirect_to "/posts/#{params[:post_id]}"
	end

	def show
	end

	def edit
	end
	
	def update
	end

	def destroy
		@comment = Comment.find(params[:id],params: {:post_id => params[:post_id]})
		@comment.destroy
		redirect_to post_path(params[:post_id])
	end

	def comment_params
      params.require(:comment).permit(:author, :content)
    end

end
