class ApplicationsController < ApplicationController
  def index
    @apps = current_user.applications
  end

  def show
    @app = Application.find(params[:id])
    @stage = @app.docker_servers.select{|server| server.server_type == "stage"}
    @deploy = @app.docker_servers.select{|server| server.server_type == "deploy"}
    @tags = @app.docker_registry.box(@app).tags
  end
  
  def new
    @app = Application.new
  end

  def create
    if app = Application.create(application_params)
      app.create_activity(:create_application, owner: current_user, recipient: app)
      redirect_to applications_url
    else
      redirect_to :back
    end
  end

  def edit
    @app = Application.find(params[:id])
    # app.create_activity(:edit_application, owner: current_user, recipient: app)
  end

  def update
  end

  def destroy
    # app.create_activity(:destroy_application, owner: current_user, recipient: app)
  end

  private
  def application_params
    params.require(:application).permit(:name, :url)
  end
end
