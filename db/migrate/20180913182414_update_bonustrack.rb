class UpdateBonustrack < ActiveRecord::Migration[5.2]
  def change
    remove_column :tracks, :bonus
  end
end
