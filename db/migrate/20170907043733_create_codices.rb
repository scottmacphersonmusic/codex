class CreateCodices < ActiveRecord::Migration
  def change
    create_table :codices do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
