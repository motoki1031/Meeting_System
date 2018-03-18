class CreateAtendees < ActiveRecord::Migration[5.1]
  def change
    create_table :atendees do |t|
      t.string :name
      t.string :meeting_id

      t.timestamps
    end
  end
end
