require 'cpalette'
class PaletteController < ApplicationController
	def index
    @colors = Cpalette.palette(6)
	end
  def show
    @colors = Cpalette.palette(params[:id].to_i)
  end
  def create
    redirect_to palette_path(params[:colors].to_i)
  end
end
