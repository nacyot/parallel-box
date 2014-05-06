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
  end

  def logs
  end
end
