class FiguresController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_figure, only: [:show, :edit, :update]

  def index
    @pagy, @figures = pagy(Figure.all, items: 6)
  end

  def show; end
  
  def new
    @figure = Figure.new
  end

  def create
    @figure = current_user.figures.new figure_params
    if @figure.save
      return redirect_to root_url, notice: t('.notice')
    end
    render :new
  end

  def edit; end

  def update
    @figure = Figure.find params[:id]

    if @figure.update figure_params
      return redirect_to @figure, notice: t('.notice')
    end

    render :edit 
  end

  private 

  def figure_params
    params.require(:figure).permit(:name, :year, :brand, :photo)
  end

  def set_figure 
    @figure = Figure.find params[:id]
  end

end
