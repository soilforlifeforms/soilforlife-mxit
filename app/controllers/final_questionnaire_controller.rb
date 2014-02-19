class FinalQuestionnaireController < ApplicationController
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

      step :overall_training_impression do
        select :overall_training_impression, 'Overall, I thought the training was very good', {
          'Strongly disagree' => 'Strongly disagree', 
          'Disagree' => 'Disagree',
          'No Opinion' => 'No Opinion',
          'Agree' => 'Agree',
          'Strongly Agree' => 'Strongly Agree'
        }
      end

      step :done do
        proceed 'Submit my information'
      end

      submit do
        item = FinalQuestionnaire.new
        itemy.overall_training_impression = params[:overall_training_impression]
        item.save!

        redirect_to '/final'
      end
    end
  end
end
