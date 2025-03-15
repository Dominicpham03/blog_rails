class PostsController < ApiController
    before_action :set_post, only: [:show, :update, :destroy]
    self.page_size = 5 #set a different page size for post 
    belongs_to :user

    validates :title, :body, presence: true



  
    # GET /posts
    def index
      posts = Post.page(params[:page]).per(self.page_size)
      render json: posts
    end
  
    # GET /posts/:id
    def show
      render json: @post
    end
  
    # POST /posts
    def create
      post = Post.new(post_params)
      post.user = User.find(params[:user_id]) 
    
      if post.save
        render json: post, status: :created
      else
        render json: post.errors, status: :unprocessable_entity
      end
    end
    
  
    # PUT /posts/:id
    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /posts/:id
    def destroy
      @post.destroy
      head :no_content
    end
  
    private
    #
    def set_post
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Post not found" }, status: :not_found
    end
  
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
  end
  