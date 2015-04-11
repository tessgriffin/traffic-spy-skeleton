class ChangeResolutionTable < ActiveRecord::Migration
  def change
    remove_column :resolutions, :width, :string
    remove_column :resolutions, :height, :string
    add_column :resolutions, :dimension, :string
  end
end
