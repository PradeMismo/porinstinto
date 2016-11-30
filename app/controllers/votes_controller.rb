class VotesController < ApplicationController
  load_and_authorize_resource

  def index
    @votes = Vote.paginate(:page => params[:page], :per_page => 25)
    @unsorted_songs = Song.all
    @songs = @unsorted_songs.sort_by{|song| song.votes.count}.reverse
  end

  def new
    @provinces = Provincias.all
    @songs_first = Record.studio.first.songs
    @songs_second = Record.studio.last.songs
  end 

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      flash[:success] = 'Gracias por participar! Te informaremos si resultas ganador.'
      redirect_to entries_path
    else 
      flash[:error] = 'Error: no se ha podido enviar el voto, prueba otra vez.'
      render :new
    end
  end


  private

  def vote_params
    params.require(:vote).permit(:name, :email, :province, :comment, :song_ids)
  end
end