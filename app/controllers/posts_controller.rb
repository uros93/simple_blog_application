
class PostsController < ApplicationController
	
	before_action :set_post, only: [:show, :update, :edit, :destroy]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new(:title => "", :content => "")
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to post_path(@post)
		else
			render "new"
		end

	end

	def show

		@comments = Comment.find(:all, :params => {:post_id => params[:id]})
	end

	def edit
	end
	
	def update
		
    	
		if @post.update_attributes(post_params)
			redirect_to post_path(@post.id)
		else
			render "edit"
		end
	end

	def destroy
		@post.destroy
		redirect_to :action => 'index'
	end

	private

	def post_params
      params.require(:post).permit(:title, :content)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
