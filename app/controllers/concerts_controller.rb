class ConcertsController < ApplicationController
  load_and_authorize_resource

  def index
    @concerts = Concert.next
    flash.now[:info] = "Actualmente no hay conciertos programados" unless @concerts.present?
  end

  def last
    @concerts = Concert.previous
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
