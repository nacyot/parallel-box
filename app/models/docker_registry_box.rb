class DockerRegistryBox
  attr_reader :url
  
  def initialize(host, port, repository_name)
    @host = host
    @port = port
    @name = repository_name
  end

  def tags
    JSON.parse open(url + "/tags").read
  end

  private
  def url
    @host + ":" + @port + "/v1/repositories/" + @name
  end
end
