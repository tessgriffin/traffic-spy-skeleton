class AddResolutionColumnToPayloadTable < ActiveRecord::Migration
  def change
    remove_column :payloads, :resolution_width, :string
    remove_column :payloads, :resolution_height, :string
    add_column :payloads, :resolution_id, :integer 
  end
end
