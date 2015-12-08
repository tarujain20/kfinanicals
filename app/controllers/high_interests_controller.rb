class HighInterestsController < ApplicationController
  def index
  end
  def new
    @high_interest = HighInterest.new
  end
end
