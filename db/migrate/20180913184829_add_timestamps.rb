class AddTimestamps < ActiveRecord::Migration[5.2]
  def change
    [:users, :bands, :albums, :tracks].each do |table|
      change_table(table) { |t| t.timestamps }
    end
  end
end
