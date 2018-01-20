class InvitationsController < ApplicationController
  before_action :require_user

  def new
    @invitation = Invitation.new
  end



  def create
    # binding.pry
    # Invitation.create(params[:invitation].merge!(inviter_id: current_user.id))
    @invitation = Invitation.new(invitation_params.merge!(inviter_id: current_user.id))
    # @invitation = Invitation.   new(    invite_params.merge!(inviter_id: current_user.id))
    # binding.pry
    if @invitation.save
      AppMailer.delay.send_invitation_email(@invitation)
      flash[:success] = "Invitation sent!"
      redirect_to new_invitation_path
    else
      flash[:error] = "Please fill in all the fields before sending invite."
      render :new
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit!
  end
end
