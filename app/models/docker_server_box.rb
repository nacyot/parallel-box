class DockerServerBox
  include Docker
  
  def initialize(url)
    self.url = url
  end

  def containers
    @containers || @containers = Container.all({}, connection) 
  rescue
    puts "false"
    return {}
  end
  
  def images
    @images || @images = Image.all({}, connection)
  end
  
  def container(hash)
    Container.new connection, hash
  end

  def start(host, image, tag)
    image_name = host + "/" + image + ":" + tag
    create_options = {
      'Image' => image_name
    }

    start_options = {
      "PortBindings" => {
        "3000/tcp" => [{"HostIp"=>"0.0.0.0"}],
        "9000/tcp" => [{"HostIp"=>"0.0.0.0"}]
      },
    }
    
    Container.create(create_options , connection).start(start_options)
  end

  def stop(container_id)
    Container.get(container_id, {}, connection).
      tap(&:stop).
      delete(force: true)
  end
  
  def image(hash)
    Image.new connection, hash
  end

  def app_containers(tags)
    tags.map do |tag|
      image_tag, image_hash = tag[0], tag[1]
      
      result = containers.select do |server|
        server.info["Image"].match(/^(?<host>.*?)\/(?<app_name>nacyot-bbapi):(?<tag>.*?)$/) do |md|
          md["tag"] == image_tag
        end
      end
      
      {
        image_tag: image_tag,
        image_hash: image_hash,
        containers: result
      }
    end
  end

  public(:default_socket_url, :env_url, :url, :url=, :options,
         :options=, :creds, :creds=, :logger, :logger=,
         :connection, :reset_connection!, :version, :info,
         :authenticate!, :validate_version!)

end
