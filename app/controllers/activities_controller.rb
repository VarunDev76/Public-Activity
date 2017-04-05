class ActivitiesController < ApplicationController
  def index
  	# binding.pry
  	# comment_ids = Recipe.where("post_id IN (#{post_ids})", user_id: @user.id).map(&:id)
  	@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: User.ids, owner_type: "User")

  end

  def edit
  	@activity = PublicActivity::Activity.order("created_at desc").find(params[:id])
  end

  def update
  	@activity = PublicActivity::Activity.order("created_at desc").find(params[:id])
  	# if @activity.update(params[:trackable_type])
  	# 	redirect_to activities_url
  	# end
  end

  def destroy
  	
  end

end
