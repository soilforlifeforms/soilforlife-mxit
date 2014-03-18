class InitialQuestionnaire < ActiveRecord::Base
 # self.set_table_name "InitialQuestionnaire"
  attr_accessible :age, :area, :gender, :group, :trainer
end
