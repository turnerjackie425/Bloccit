class PostsController < ApplicationController

skip_before_action :flash_attack, only: [:index, :new]
    

  def index
    @posts = Post.all
    authorize @posts
    @posts = policy_scope(Post)
  end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create

    @post = Post.new(post_params)

    @topic = Topic.find(params[:topic_id])
    @post = Post.new(params.require(:post).permit(:title, :body))

    @post.user = current_user
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

   def update
     @post = Post.find(params[:id])
     authorize @post
     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

   private

  def post_params
    params.require(:post).permit(:title, body)
  end 

  def markdown_title
    render_as_markdown
  end

  def markdown_body
    render_as_markdown
  end 

  
 private

  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end
end
