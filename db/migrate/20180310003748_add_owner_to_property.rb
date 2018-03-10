class AddOwnerToProperty < ActiveRecord::Migration[5.1]
  def change
    add_reference :properties, :property_owner, foreign_key: true
  end
end
