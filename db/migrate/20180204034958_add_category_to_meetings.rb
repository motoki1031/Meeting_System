class AddCategoryToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :category, :string
  end
end
