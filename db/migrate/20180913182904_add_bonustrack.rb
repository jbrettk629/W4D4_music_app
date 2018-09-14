class AddBonustrack < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :bonus, :boolean, null:false, default:false
  end
end
