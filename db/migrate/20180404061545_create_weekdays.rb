class CreateWeekdays < ActiveRecord::Migration[5.1]
  def change
    create_table :weekdays do |t|
      t.string :name
      t.references :workout, foreign_key: true

      t.timestamps
    end
  end
end
