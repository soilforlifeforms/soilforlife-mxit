class InitialQuestionnaireController < ApplicationController
  include MxitRails::Page 
  def index
    @first_visit = params[:first_visit]
    form do 
      step :start do
        proceed 'Start the form'
        mxit_form_session[:dummy] = 'TEST'
      end

      step :trainer_name do
        input :trainer_name, 'Trainer Name'
      end

      step :group_name do
        input :group_name, 'Group Name'
      end

      step :done do 
        @trainer_name = params[:trainer_name]
        @group_name = params[:group_name]
        logger.info 'completed'
      end
      
      submit do
        logger.info 'sup'
      end
    end
  end
end
