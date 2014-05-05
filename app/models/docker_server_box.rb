class DockerServerBox
  include Docker

  attr_reader :host, :port
  
  def initialize(host,port)
    @host = host
    @port = port
    self.url = host + ":" + port
  end

  def containers
    @containers || @containers = Container.all({}, connection).map do |container|
      DockerContainerBox.new(self, container)
    end
  rescue
    puts "false"
    return {}
  end
  
  def images
    @images || @images = Image.all({}, connection)
  end

  def get_container(container_id)
    DockerContainerBox.new(self, Container.get(container_id, {}, connection))
  end
  
  def start(host, image, tag, ports = [])
    image_name = host + "/" + image + ":" + tag
    create_options = {
      'Image' => image_name
    }

    start_options = {
      "PortBindings" => create_port_mapping(ports)
    }

    puts create_port_mapping(ports)
    
    DockerContainerBox.new(self, Container.create(create_options , connection).start(start_options))
  end

  def app_containers(tags)
    tags.map do |tag|
      image_tag, image_hash = tag[0], tag[1]
      
      result = containers.select do |box|
        box.container.info["Image"].match(/^(?<host>.*?)\/(?<app_name>nacyot-bbapi):(?<tag>.*?)$/) do |md|
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

  private
  def create_port_mapping(ports)
    # cport == container_port
    # hport == host_port

    ports.inject({}) do |sum, port|
      host_info = {"HostIp" => "0.0.0.0"}
      host_info = host_info.merge({"HostPort" => "#{port[:hport]}"}) if port[:hport]

      sum.merge({"#{port[:cport]}/#{port[:method]}" => [host_info]})
    end
  end
end
