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
    if Application.create(application_params)
      redirect_to applications_url
    else
      redirect_to :back
    end
  end

  def edit
    @app = Application.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def application_params
    params.require(:application).permit(:name, :url)
  end
end
