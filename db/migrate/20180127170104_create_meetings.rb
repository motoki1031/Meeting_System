class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.string :title
      t.integer :times
      t.string :atrri
      t.string :room
      t.datetime :started_at
      t.datetime :closed_at
      t.string :remarks
      t.datetime :registered_at
      t.datetime :updated_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
