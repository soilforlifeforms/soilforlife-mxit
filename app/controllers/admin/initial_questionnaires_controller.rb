class Admin::InitialQuestionnairesController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!

  def index
    @results = InitialQuestionnaire.all
  end
end
