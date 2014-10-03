class MembersController < ApplicationController

  def new
    @member = Member.new
    flash.now[:tip] = "Adjunta una imagen de 300x180"  
  end 

  def create
    @member = Member.new(params[:member])

    if @member.save
      flash[:success] = "Member succesfully created"
      redirect_to bio_entries_path
    else
      flash[:error] = "Error: member couldn't be created"
      redirect_to bio_entries_path
    end
  end


  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      flash[:success] = "Member succesfully updated"
      redirect_to bio_entries_path
    else
      flash[:error] = "Error: member couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:success] = 'Member deleted'
    redirect_to bio_entries_path
  end
end
