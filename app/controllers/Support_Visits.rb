class InitialQuestionnaireController < ApplicationController
  include MxitRails::Page 
  def index
    @first_visit = params[:first_visit]
    form do 
      step :start do
        proceed 'Start the form'
        mxit_form_session[:dummy] = 'TEST'
      end

        step :still_growing_sv do
          select :still_growing_sv , 'Is the trainee still growing?', {
          'yes' => 'yes', 
          'no' => 'no',
        end
# Only show WhyTraineeIsntGrowingSV if no to StillGrowingSV.

         step :why_trainee_isnt_growing_sv do
          input :why_trainee_isnt_growing_sv, 'why is this change significant?'
         end

          step :mini_nursery do
          select :mini_nursery , 'Is there a mini Nursery?', {
          'yes' => 'yes', 
          'no' => 'no',
        end

        #Don't show mini_nursery_rating if no chosen above

         step :mini_nursery_rating do
        input :mini_nursery_rating, 'Please rate the nursery from 1-5, using this criteria: 
        1 star - not goot at all - the gardener is not practicing SFL methods of gardening.
        2 stars - not good - The gardener is only practacing a few of SFLs gardening methods
        3 stars- ok - the garden is practicing some of SFLs methods
        4 stars- good - the gardener is practcing many of SFLs methods
        5 stars- excellent - the gardener is practing most of SFLs methods', {
        end

         step :compost_heap do
          select :compost_heap , 'Is there a Compost Heap?', {
          'yes' => 'yes', 
          'no' => 'no',
        end

        #Don't show compost_heap_rating if no chosen above

        step :compost_heap_rating do
        input :compost_heap_rating, 'Please rate the Compost heap from 1-5, using this criteria: 
          1 star - not goot at all - the gardener is not practicing SFL methods of gardening.
          2 stars - not good - The gardener is only practacing a few of SFLs gardening methods
          3 stars- ok - the garden is practicing some of SFLs methods
          4 stars- good - the gardener is practcing many of SFLs methods
          5 stars- excellent - the gardener is practing most of SFLs methods', {
        end

         step :trench_bed do
          select :TrenchBed , 'Is there a TrenchBed?', {
          'yes' => 'yes', 
          'no' => 'no'
        end


        #Don't show amount_of_trench_beds or trench_bed_rating if no chosen above

        step :amount_of_trench_beds do
        input :amount_of_trench_beds, 'How many trench beds are there?'

      step :trench_bed_rating do
        input :trench_bed_rating, 'Please rate the Compost heap from 1-5, using this criteria: 
          1 star - not goot at all - the gardener is not practicing SFL methods of gardening.
          2 stars - not good - The gardener is only practacing a few of SFLs gardening methods
          3 stars- ok - the garden is practicing some of SFLs methods
          4 stars- good - the gardener is practcing many of SFLs methods
          5 stars- excellent - the gardener is practing most of SFLs methods', {
        end
        

        step :container_garden do
          select :container_garden, 'Is there a Container tyre garden?', {
          'yes' => 'yes', 
          'no' => 'no'
        end

           #Don't show Amount_of_container_gardens or container_garden_rating  if no chosen above

         step :amount_of_container_gardens do
        input :amount_of_container_gardens, 'How many Container Gardens are there?'
      end

      step :container_garden_rating do
        input :container_garden_rating, 'Please rate the Container garden from 1-5, using this criteria: 
          1 star - not goot at all - the gardener is not practicing SFL methods of gardening.
          2 stars - not good - The gardener is only practacing a few of SFLs gardening methods
          3 stars- ok - the garden is practicing some of SFLs methods
          4 stars- good - the gardener is practcing many of SFLs methods
          5 stars- excellent - the gardener is practing most of SFLs methods', {
        end


        step :other_types_of_garden do
         select :other_types_of_garden, 'Is there any other kind of garden?', {
          'yes' => 'yes', 
          'no' => 'no'
        end

        #Don't show other_types_of_garden_kind or other_types_of_garden_rating  if no chosen above

         step :other_types_of_garden_kind do
        input :other_types_of_garden_kind, 'What kind of garden is it?'
      end


      step :other_types_of_garden_rating do
        input :other_types_of_garden_rating, 'Please rate the Other type of garden, using this criteria: 
          1 star - not goot at all - the gardener is not practicing SFL methods of gardening.
          2 stars - not good - The gardener is only practacing a few of SFLs gardening methods
          3 stars- ok - the garden is practicing some of SFLs methods
          4 stars- good - the gardener is practcing many of SFLs methods
          5 stars- excellent - the gardener is practing most of SFLs methods'
        end
        

        step :vegetales_from_garden_sv do
        select :vegetales_from_garden_sv, 'How often does trainee pick vegetables from the garden to eat?', {
          'Everyday' => 'Everyday',
          'Once a week' => 'Once a week',
          '2 to 3 times a month' => '2 to 3 times a month',
          'Once a month' => 'Once a month', 
          'Less than once a month' => 'Less than once a month',
          'six' => 'six',
          'six+' => 'six+',
        end

        step :what_eating_from_garden do
        select :what_eating_from_garden, 'What vegetables has the trainee eaten from the garden in the past month?', {
          'Carrots' => 'Carrots', 
          'Beetroot' => 'Beetroot',
          'Turnip' => 'Turnip',
          'Radish' => 'Radish',
          'Onion' => 'Onion',
          'Leek' => 'Leek',
          'Kale' => 'Kale',
          'Lettuce' => 'Lettuce',
          'Cabbage' => 'Cabbage',
          'Cauliflower' => 'Cauliflower',
          'Broccoli' => 'Broccoli',
          'Celery' => 'Celery',
          'Parsley' => 'Parsley',
          'Morog' => 'Morog',
          'tomato' => 'tomato',
          'pepper' => 'pepper',
          'Chilli' => 'Chilli',
          'Egg plant' => 'Egg plant',
          'Kohlrabi' => 'Kohlrabi',
          'Cucumber' => 'Cucumber',
          'Pumpkin' => 'Pumpkin',
          'Squash' => 'Squash',
          'Marrow' => 'Marrow',
          'Mealies' => 'Mealies',
          'Melons' => 'Melons',
          'Potato' => 'Potato',
          'Sweet Potato' => 'Sweet Potato',
          'Bush beans' => 'Bush beans',
          'Climbing beans' => 'Climbing beans',
          'broad beans' => 'broad beans',
          'Peas' => 'Peas',
          'Other' => 'Other',
        end


        step :trainee_selling_sp do
          select :trainee_selling_sp, 'Is the trainee selling anything that has come from his/her garden or from life skills lessons?', {
          'yes' => 'yes', 
          'no' => 'no'
        end


        #Don't show trainee_selling_sp_qualitative or trainee_selling_sq_ualitative_amount if no chosen above



        step :trainee_selling_sp_qualitative do
        input :trainee_selling_sp_qualitative, 'What has the trainnee sold in the last month? ?'
      end

         step :trainee_selling_sq_qualitative_amount do
          select :trainee_selling_sq_qualitative_amount, 'How much has the trainee made in the last month?', {
          'R1-R50' => 'R1-R50', 
          'R51-R100' => 'R51-R100',
          'R101-R150' => 'R101-R150',
          'R151-R200' => 'R151-R200',
          'N/A' => 'Prefer not to answer'
        end

         step :trainee_future_plans do
        input :trainee_future_plans, 'What is the trainee planning to do with his/her garden?'
      end


         step :issues_and_challenges do
        input :issues_and_challenges, 'Are there any Issues or challenges with the garden?'
      end

       step :garden_postivies do
        input :garden_postivies, 'What is good about the garden?'
      end

       step :garden_possibile_improvements do
        input :garden_possibile_improvements, 'What could be better about the garden?'
      end

      step :final_comments_SV do
        input :final_comments_SV, 'Any final comments?'
      end








