class CreateFinalQuestionnaires < ActiveRecord::Migration
  def change
    create_table :final_questionnaires do |t|
      t.string :overall_training_impression

      t.timestamps
    end
  end
end
