class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.string :region
      t.integer :abv
      t.integer :creator_id
    end
  end
end
