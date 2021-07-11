class CommentsController < ApplicationController
  before_action :redirect_if_not_logged_in

    def new
        if @job = Job.find_by_id(params[:job_id]) 
            @comment = @job.comments.build
            #use build so the comment already knows which job is assoc
          else
            @comment = Comment.new
          end
    end

    def create
      @comment = Comment.new(comment_params)
      @comment.user_id = session[:user_id] 
      # @comment = current_user.comments.build(comment_params)
      #if it reloads, we want it to re-render the information that has been added so far
      if @comment.save
          #retuns same value as valid. automatically checks belongs to
          redirect_to comment_path(@comment)
      else           
          render :new
      end
    end

    def index
      if params[:job_id]
          @comments = Job.find(params[:job_id]).comments
      else
        @comments = Comment.all
      end 
    end

    def show
      @comment = Comment.find_by_id(params[:id])
    end

  def comment_params
      params.require(:comment).permit(:content, :job_id)
  end

end
