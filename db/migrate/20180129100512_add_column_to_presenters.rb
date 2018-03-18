class AddColumnToPresenters < ActiveRecord::Migration[5.1]
  def change
    add_column :presenters, :user_id, :bigint
    add_column :presenters, :filepath, :string
  end
end
