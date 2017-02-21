class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :choice_a
      t.string :choice_b
      t.string :tags
      t.integer :user_id

      t.timestamps
    end
  end
end
