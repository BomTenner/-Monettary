class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :show_balance

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def show_balance
    @all_addresses = Address.all
    @balance = []
    @all_addresses.each do |address|
      @balance << address.balance * address.asset.price
    end
    @final_balance = @balance.sum
  end
end
