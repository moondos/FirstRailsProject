class PostsController < ApplicationController
    # http_basic_authenticate_with name: "admin", password: "1234", except: [:index, :show]
    load_and_authorize_resource
    before_action :set_user_id
    def index
        @posts = Post.all
        
    end

    def show
        @post = Post.find(params[:id])
        
    end


    def new
        @post = Post.new
    end


    def create
        #render plain: params[:post].inspect
        @post = Post.new(post_params)

        if(@post.save)
            # Create the notifications
            Notification.create(recipient: User.find(1), actor:User.find(session[:user_id]), action: "posted", notifiable: @post)
            redirect_to @post            
            
        else 
            render 'new'
        
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if(@post.update(post_params))
            redirect_to @post
        else 
            render 'edit'
        
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
            
        redirect_to posts_path

    end


    private 
    
    def post_params
        params.require(:post).permit(:title, :body)
    end

    def set_user_id
        @user_id = User.find_by_id(1)
    end


end
