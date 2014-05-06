class MainController < ApplicationController
  def index
    @apps = current_user.applications
    @activities = PublicActivity::Activity.
      where(recipient_type: "Application", recipient_id: User.last.applications.map(&:id)).
      order("created_at DESC")
  end
end
