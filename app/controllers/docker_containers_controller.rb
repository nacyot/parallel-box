class DockerContainersController < ApplicationController
  def run
    server = DockerServer.find(permitted_params[:docker_server_id])
    ports = [{cport: "3000", method: "tcp"}, {cport: "9000", method: "tcp"}]
    
    server.box.start(permitted_params[:registry_host], permitted_params[:name], permitted_params[:tag], ports)
    server.create_activity(:run_container, owner: current_user, recipient: server.application)    
    redirect_to :back
  end

  def stop
    server = DockerServer.find(permitted_params[:docker_server_id])
    server.box.get_container(permitted_params[:container_id]).stop
    server.create_activity(:stop_container, owner: current_user, recipient: server.application)    
    redirect_to :back
  end

  def info
    server = DockerServer.find(permitted_params[:docker_server_id])
    container = server.box.get_container(permitted_params[:container_id])
    @info = container.info
  end

  def logs
    server = DockerServer.find(permitted_params[:docker_server_id])
    container = server.box.get_container(permitted_params[:container_id])
    @info = container.logs
  end

  private
  def permitted_params
    params.permit(:docker_server_id, :name, :tag, :container_id, :registry_host)
  end
end
