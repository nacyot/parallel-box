class DockerContainerBox
  attr_reader :container
  
  def initialize(server, container)
    @server = server
    @container = container
  end
  
  def stop
    @container.tap(&:stop).delete(force: true)
  end

  def short_id
    @container.id[0..10]
  end

  def info
    @container.info
  end

  def name
    @container.info["Names"][0]
  end
  
  def urls
    @container.info["Ports"].map do |port|
      [
       @server.host.sub(/tcp/, "http") + ":" + port["PublicPort"].to_s,
       port["PrivatePort"].to_s
      ]
    end
  end
end
