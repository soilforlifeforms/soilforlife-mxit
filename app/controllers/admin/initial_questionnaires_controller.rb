class Admin::InitialQuestionnairesController < ApplicationController
  def index
    @results = InitialQuestionnaire.all
  end
end
