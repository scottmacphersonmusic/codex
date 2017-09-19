class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :key, default: 'C'

      t.timestamps null: false
    end
  end
end
