class InvitationsController < ApplicationController
  before_action :require_user

  def new
    @invitation = Invitation.new
  end

  def create
    # binding.pry
    # Invitation.create(params[:invitation].merge!(inviter_id: current_user.id))
    invitation = Invitation.create(invitation_params.merge!(inviter_id: current_user.id))
    # @invitation = Invitation.   new(    invite_params.merge!(inviter_id: current_user.id))
    # binding.pry
    AppMailer.send_invitation_email(invitation).deliver
    redirect_to new_invitation_path
  end

  private

  def invitation_params
    params.require(:invitation).permit!
  end
end
