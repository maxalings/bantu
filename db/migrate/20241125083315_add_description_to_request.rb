class AddDescriptionToRequest < ActiveRecord::Migration[7.1]
  def change
    add_column :requests, :description, :string
  end
end
