class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :contactphone
      t.string :workphone
      t.string :address
      t.string :telegram
      t.string :whatsapp
      t.string :viber
      t.text :history

      t.timestamps null: false
    end
  end
end
