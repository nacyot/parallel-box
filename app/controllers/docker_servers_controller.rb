class DockerServersController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @server = DockerServer.new
  end

  def create
    if server = DockerServer.create(docker_servers_params.merge(application_id))
      redirect_to application_url(server.application)
    else
      redirect_to :back
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def docker_servers_params
    params.require(:docker_server).permit(:name, :host, :port, :server_type, :description,)
  end

  def application_id
    params.permit(:application_id)
  end
end
 
