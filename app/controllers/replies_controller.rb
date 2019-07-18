class RepliesController < ApplicationController
    before_action :set_reply, only: [:destroy, :edit, :update]
       
    def create
			@reply = Reply.new(reply_params)
			if @reply.save
					flash[:notice] = "Reply criado com sucesso"
					redirect_to article_path(params[:article_id])
			else
          flash[:error] = @reply.errors.full_messages
          redirect_to article_path(params[:article_id])
			end
    end

    def destroy
      @reply.destroy
      flash[:notice] = "O artigo foi deletado"
      redirect_to article_path(@article)
    end

    def update
      if @reply.update(reply_params2)
       flash[:notice] = "Reply Updated"
       redirect_to article_path(@article)
      else
       flash[:error] = @reply.errors.full_messages
       redirect_to article_path(@article)
      end
    end


    private

    def reply_params
    params.permit(:description, :user_id, :article_id)
    end

    def reply_params2
      params.require(:reply).permit(:description)
    end

    def set_reply
      @reply = Reply.find(params[:id])
      @article = @reply.article
    end


end