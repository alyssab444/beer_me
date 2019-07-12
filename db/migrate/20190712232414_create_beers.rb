class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.integer :abv
      t.integer :ibu
      t.references :user 

      t.timestamps
    end
  end
end
