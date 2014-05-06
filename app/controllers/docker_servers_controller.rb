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
      # server.create_activity(:create_docker_server, owner: current_user, recipient: server.application)
      redirect_to application_url(server.application)
    else
      redirect_to :back
    end
  end

  def edit
  end

  def update
    # server.create_activity(:update_docker_server, owner: current_user, recipient: server.application)    
  end

  def destroy
    # server.create_activity(:destroy_docker_server, owner: current_user, recipient: server.application)
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
 
