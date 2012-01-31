class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.text :reason
      t.string :display
      t.timestamps
    end
  end
end
