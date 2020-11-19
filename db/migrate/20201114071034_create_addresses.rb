class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, null: false
      t.string :street_number
      t.string :street_name
      t.string :state
      t.string :postcode

      t.timestamps
    end
  end
end
