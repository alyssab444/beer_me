class ChangeForeignKeyForBeer < ActiveRecord::Migration[6.0]
  def change
    rename_column :beers, :user_id, :creator_id
  end
end
