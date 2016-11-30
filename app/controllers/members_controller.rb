class MembersController < ApplicationController
  load_and_authorize_resource

  def new
    flash.now[:tip] = "Adjunta una imagen de 300x180"  
  end 

  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:success] = "Member succesfully created"
      redirect_to bio_entries_path
    else
      flash[:error] = "Error: member couldn't be created"
      redirect_to bio_entries_path
    end
  end


  def edit
  end

  def update
    if @member.update_attributes(member_params)
      flash[:success] = "Member succesfully updated"
      redirect_to bio_entries_path
    else
      flash[:error] = "Error: member couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @member.destroy
    flash[:success] = 'Member deleted'
    redirect_to bio_entries_path
  end


  private

  def member_params
    params.require(:member).permit(:name, :instrument, :photo)
  end
end
