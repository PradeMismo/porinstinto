class ConcertsController < ApplicationController

  def index
    @next_concerts = Concert.next.order("date ASC")
    flash.now[:info] = "Actualmente no hay conciertos programados" unless @next_concerts.present?
    @previous_concerts = Concert.previous.order("date DESC").paginate(:page => params[:page], :per_page => 12)
  end


  def new
    @concert = Concert.new  
  end 

  def create
    @concert = Concert.new(params[:concert])

    if @concert.save
      flash[:success] = "Concert succesfully created"
      redirect_to concerts_path
    else
      flash[:error] = "Error: concert couldn't be created"
      redirect_to concerts_path
    end
  end


  def edit
    @concert = Concert.find(params[:id])
  end

  def update
    @concert = Concert.find(params[:id])
    if @concert.update_attributes(params[:concert])
      flash[:success] = "Concert succesfully updated"
      redirect_to concerts_path
    else
      flash[:error] = "Error: concert couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy
    flash[:success] = 'Concert deleted'
    redirect_to concerts_path
  end

end
