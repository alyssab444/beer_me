class ChangeColumnNameInBeers < ActiveRecord::Migration[6.0]
  def change
    rename_column :beers, :ibu, :region
  end
end
