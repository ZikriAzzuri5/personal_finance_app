class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.string :code, null: false
      t.string :country_code, null: false

      t.timestamps
    end
  end
end
