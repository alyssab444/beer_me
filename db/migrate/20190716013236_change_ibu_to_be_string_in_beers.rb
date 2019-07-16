class ChangeIbuToBeStringInBeers < ActiveRecord::Migration[6.0]
  def change
    change_column :beers, :ibu, :string
  end
end
