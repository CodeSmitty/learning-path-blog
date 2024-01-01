class BlogPostsController < ApplicationController
    before_action :authenticate_user!, except:[:index, :show]
    # only:[:show, :edit, :update, :destroy]  <---- ONlY means for only those functions. Except means everything except functions listed. 
    before_action :set_blog_post, except:[:index, :new, :create ] 
    
    
    def index
         @blog_posts = BlogPost.all 

    end

    def show
        
    
    end

    def new
        
        @blog_post = BlogPost.new
    end

    def create
        @blog_post = BlogPost.new(blog_post_params)
        if @blog_post.save
          flash[:success] = "Object successfully created"
          redirect_to @blog_post
        else
          flash[:error] = "Something went wrong"
          render 'new', status: :unprocessable_entity
        end
    end

    def edit
        
    end

    def update
        
        if @blog_post.update(blog_post_params)
          flash[:success] = "Blog was successfully updated"
          redirect_to @blog_post
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        
        if @blog_post.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to root_path
        else
            flash[:error] = 'Something went wrong'
            redirect_to blog_posts_url
        end
    end
    
    
    

    private 


    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end 

    def set_blog_post 
        @blog_post = BlogPost.find(params[:id])
        rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
    
    # def authenticate_user
    # This function is equal more or less to what devise provides with the before_action "authenticate_user"
    #     redirect_to new_user_session_path, alert: "You must sign in or sign up to continue." unless user_signed_in?
    # end
    
    

end