class VotesController < ApplicationController
  before_filter :authorize, only: [:index]

  def index
    @votes = Vote.paginate(:page => params[:page], :per_page => 25)
  end

  def new
    @vote = Vote.new
    @provinces = Provincias.all
    @songs_first = Record.studio.first.songs
    @songs_second = Record.studio.last.songs
  end 

  def create
    @vote = Vote.new(params[:vote])
    if @vote.save
      flash[:success] = 'Gracias por participar! Te informaremos si resultas ganador.'
      redirect_to entries_path
    else 
      flash[:error] = 'Error: no se ha podido enviar el voto, prueba otra vez.'
      render :new
    end
  end

  private

  def authorize
    unless current_admin.present? 
      flash[:error] = 'Acceso denegado'
      redirect_to entries_path
    end
  end

end
