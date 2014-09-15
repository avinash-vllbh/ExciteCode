require 'cpalette'
class PaletteController < ApplicationController
	def index
    @colors = Cpalette.palette(6)
	end
  def show
    colors = params[:id].to_i
    if colors > 0 && colors<= 10
      @colors = Cpalette.palette(colors)
    else
      flash[:notice] = "Please select a value between 1 to 10 for demo"
      redirect_to palette_index_path
    end
  end
  def create
    redirect_to palette_path(params[:colors].to_i)
  end
end
