class CreatePresenters < ActiveRecord::Migration[5.1]
  def change
    create_table :presenters do |t|
      t.string :name
      t.string :title
      t.string :document1
      t.string :document2
      t.string :document3
      t.string :document4
      t.string :meeting_id

      t.timestamps
    end
  end
end
