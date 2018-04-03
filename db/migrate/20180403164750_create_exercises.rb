class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
