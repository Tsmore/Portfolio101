class ApplicationController < ActionController::Base
  before_action :set_contact

  private

  def set_contact
    @contact = Contact.new
  end

end
