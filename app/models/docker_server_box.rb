class DockerServerBox
  include Docker
  
  def initialize(url)
    self.url = url
  end

  def containers
    Container.all({}, connection)
  end
  
  def images
    Image.all({}, connection)
  end
  
  def container(hash)
    Container.new connection, hash
  end
  
  def image(hash)
    Image.new connection, hash
  end
  
  public(:default_socket_url, :env_url, :url, :url=, :options,
         :options=, :creds, :creds=, :logger, :logger=,
         :connection, :reset_connection!, :version, :info,
         :authenticate!, :validate_version!)
end
