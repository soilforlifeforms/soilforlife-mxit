class VisitController < ApplicationController
  include MxitRails::Page
  def index
    @first_visit = params[:first_visit]
    form do 
      step :start do 
        proceed 'Start the form'
        mxit_form_session[:dummy] = 'randomT'
      end

      step :trainer do
        input :trainer, 'Trainer'
      end

      step :group do
        input :group, 'Group'
      end

      step :area do
        input :area, 'Area'
      end
    end
  end
end
