# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_user, only: [:index]
  def index
    @user = set_user
  end

  private

  def set_user
    User.find_by(person: current_person.id) if person_signed_in?
  end
end
