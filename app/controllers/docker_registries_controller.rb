class DockerRegistriesController < ApplicationController
  def index
    @registries = DockerRegistry.all
  end

  def show
    @registry = DockerRegistry.find(params[:id])
  end
  
  def new
    @registry = DockerRegistry.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
