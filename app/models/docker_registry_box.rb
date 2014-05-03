class DockerRegistryBox
  attr_reader :url
  
  def initialize(repository_name)
    @url = repository_url(repository_name) 
  end

  def tags
    JSON.parse open(@url + "/tags").read
  end

  private
  def repository_url(name)
    registry_host + "/v1/repositories/" + name
  end

  def registry_host
    "http://" + ENV['DOCKER_REGISTRY_HOST'] + ":" + ENV['DOCKER_REGISTRY_PORT']
  end
end
