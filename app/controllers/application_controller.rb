# frozen_string_literal: true

class ApplicationController < ActionController::Base

  around_action :handle_exception

  def home
  end

  def about
  end

  def dogs
  end

  def food
  end

  private

  def handle_exception
    begin
      yield
    rescue ActiveRecord::RecordNotFound => e
      puts e.message
      flash[:alert] = e.message
      redirect_to root_url
    rescue StandardError => e
      puts e.message
      flash[:alert] = e.message
      redirect_back fallback_location: root_url
    end
  end
end


# vyhledávací okénko skrz celou stránku.
# změna backgroundu na webu + možnost přidat image pro psa v zobrazení