class UpgradesController < ApplicationController
  before_action :authenticate_user!
  before_action :profile_validation

  def new
    @upgrade = Upgrade.new
  end


  def create
    user = current_user
    user_profile = user.profile
    @upgrade = Upgrade.new
    @upgrade.user = user

    authorize @upgrade
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "Upgrade to Premium",
      :currency    => 'aud'
    )

    @upgrade.transaction_id = charge.id
    @upgrade.save
    user_profile.premium = true
    user_profile.save
    NotificationMailer.user_notification(current_user).deliver_now
    redirect_to thanks_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_upgrade_path
  end

  private

  def profile_validation
    if !current_user.has_profile?
      redirect_to new_profile_path
      flash[:notice] = "Please enter your details to continue"
    end
  end

end
