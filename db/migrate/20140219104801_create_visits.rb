class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :trainer
      t.string :group
      t.string :trainee_id_number
      t.string :still_growing_sv
      t.string :why_trainee_isnt_growing_sv
      t.string :mini_nursery
      t.string :mini_nursery_rating
      t.string :compost_heap
      t.string :compost_heap_rating
      t.string :trench_bed
      t.string :amount_of_trench_beds
      t.string :trench_bed_rating
      t.string :container_garden
      t.string :amount_of_container_gardens
      t.string :container_garden_rating
      t.string :other_types_of_garden
      t.string :other_types_of_garden_kind
      t.string :other_types_of_garden_rating
      t.string :vegetales_from_garden_sv
	  t.string :what_eating_from_garden
      t.string :trainee_selling_sp
      t.string :trainee_selling_sp_qualitative
      t.string :trainee_selling_sq_qualitative_amount
      t.string :trainee_future_plans
      t.string :issues_and_challenges
      t.string :garden_postivies
      t.string :garden_possibile_improvements
      t.string :final_comments_SV
      t.timestamps
    end
  end
end
