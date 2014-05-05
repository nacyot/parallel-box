module ApplicationsHelper
  def run_container_link(server, app, tag)
    name = app.repository_name
    registry = app.docker_registry
    host = registry.host.match(/https?:\/\/(.*?)$/){|m| m[1]} + ":" + registry.port
    
    link_to "run", docker_server_run_container_url(server, name: app.repository_name, tag: tag, registry_host: host)
  end

  def stop_container_link(server, container_id)
    link_to "stop", docker_server_stop_container_url(server, container_id: container_id)
  end
end
