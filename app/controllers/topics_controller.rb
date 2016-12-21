class TopicsController < ApplicationController
    def index
        @topics = Topic.all.order('count DESC')
    end

    def new
        @topic = Topic.new
    end

    def create
        @topic = Topic.new(topic_params)
        if @topic.save
            redirect_to topics_path
        else
            render :new
        end
    end

    def show
        @topic = Topic.find(params[:id])
    end

    def edit
        @topic = Topic.find(params[:id])
    end

    def update
        @topic = Topic.find(params[:id])
        @topic.update(topic_params)
        redirect_to topics_path
    end

    def destroy
        @topic = Topic.find(params[:id])
        @topic.destroy
        redirect_to topics_path
    end

    def upvote
        @topic = Topic.find(params[:id])
        @topic.votes.create
        @topic.update_attributes(count: @topic.votes.count)
        redirect_to topics_path
   end

    def devote
        @topic = Topic.find(params[:id])
        @topic.votes.last.destroy
        @topic.update_attributes(count: @topic.votes.count)
        redirect_to topics_path
   end

    private

    def topic_params
        params.require(:topic).permit(:title, :description)
    end
end
