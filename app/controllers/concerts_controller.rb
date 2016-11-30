class ConcertsController < ApplicationController
  load_and_authorize_resource

  def index
    @next_concerts = Concert.next.order("date ASC")
    flash.now[:info] = "Actualmente no hay conciertos programados" unless @next_concerts.present?
    @previous_concerts = Concert.previous.order("date DESC").paginate(:page => params[:page], :per_page => 12)
  end


  def new
  end 

  def create
    @concert = Concert.new(concert_params)
    if @concert.save
      flash[:success] = "Concert succesfully created"
      redirect_to concerts_path
    else
      flash[:error] = "Error: concert couldn't be created"
      redirect_to concerts_path
    end
  end


  def edit
  end

  def update
    if @concert.update_attributes(concert_params)
      flash[:success] = "Concert succesfully updated"
      redirect_to concerts_path
    else
      flash[:error] = "Error: concert couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @concert.destroy
    flash[:success] = 'Concert deleted'
    redirect_to concerts_path
  end


  private

  def concert_params
    params.require(:concert).permit(:date, :place, :concert_hall, :tickets, :bands, :notes, :event_link, :ticket_link)
  end
end
