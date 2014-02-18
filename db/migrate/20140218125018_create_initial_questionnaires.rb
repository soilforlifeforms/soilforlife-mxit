class CreateInitialQuestionnaires < ActiveRecord::Migration
  def change
    create_table :initial_questionnaires do |t|
      t.string :trainer
      t.string :group
      t.string :area
      t.string :age
      t.string :gender

      t.timestamps
    end
  end
end
