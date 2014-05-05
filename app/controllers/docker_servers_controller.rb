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

  def run_container
    server = DockerServer.find(permitted_params[:docker_server_id])
    server.box.start(permitted_params[:registry_host], permitted_params[:name], permitted_params[:tag])
    redirect_to :back
  end

  def stop_container
    server = DockerServer.find(permitted_params[:docker_server_id])
    server.box.get_container(permitted_params[:container_id]).stop
    redirect_to :back
  end

  private
  def docker_servers_params
    params.require(:docker_server).permit(:name, :host, :port, :server_type, :description,)
  end

  def application_id
    params.permit(:application_id)
  end

  def permitted_params
    params.permit(:docker_server_id, :name, :tag, :container_id, :registry_host)
  end

end
 
