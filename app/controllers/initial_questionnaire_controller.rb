class InitialQuestionnaireController < ApplicationController
  include MxitRails::Page 
  def index
    @first_visit = params[:first_visit]
    form do 
      step :start do
        proceed 'Start the form'
        mxit_form_session[:dummy] = 'TEST'
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

      step :age do
        select :age, 'Choose a category that includes your age?', {
          '< 18' => 'Under 18', 
          '18-14' => '18-24',
          '25-34' => '25-34',
          '35-44' => '35-44',
          '45-54' => '45-54',
          '55-64' => '55-65',
          '> 65' => '65 or Above',
          'N/A' => 'Prefer Not to Answer'
        }
      end

      step :gender do
        select :gender, 'What is your gender?', {'male' => 'Male', 'female' => 'Female'}
      end

      step :done do 
        proceed 'Submit my information'
        @trainer = params[:trainer]
        @group = params[:group]
        @area = params[:area]
        @gender = params[:gender]
        logger.info 'completed'
      end
      
      submit do
        item = InitialQuestionnaire.new
        item.trainer = params[:trainer]
        item.group = params[:group]
        item.area = params[:area]
        item.gender = params[:gender]
        item.age =  params[:age]
        item.save!

        redirect_to '/initial'
      end
    end
  end
end
