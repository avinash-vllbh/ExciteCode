class WelcomeController < ApplicationController
  layout "landing"
  def index
    @projects = Project.all
  end
end
