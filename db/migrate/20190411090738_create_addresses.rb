class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :contact_number
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.references :addressable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
