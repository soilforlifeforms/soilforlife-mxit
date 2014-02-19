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

      step :still_growing do
        select :still_growing , 'Since you finished the training are you still growing vegetables in your food garden?', {
          'yes' => 'yes', 
          'no' => 'no'
        }
      end

      step :why_not_growing do
        if params[:still_growing] == 'yes'
           skip_to :health_compaired_to_last_year
           return
        end
        input :why_not_growing, 'Why have you stopped growing vegetables?'
      end

      step :health_compaired_to_last_year do
        select :HealthCompairedToLastYear, 'Compared to one year ago, how would you rate your health in general now?', {
          'Much better' => 'Much better now than one year ago', 
          'Somewhat better' => 'Somewhat better now than one year ago',
          'The same' => 'About the same',
          'Somewhat worse than one year ago' => 'Somewhat worse than one year ago',
          'Much worse than one year ago' => 'Much worse than one year ago'
        }
      end

      step :done do
        proceed 'Submit my information'
      end

      submit do
        item = FinalQuestionnaire.new
        item.overall_training_impression = params[:overall_training_impression]
        item.save!

        redirect_to '/final'
      end
    end
  end
end
