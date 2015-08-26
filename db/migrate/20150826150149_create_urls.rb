class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :original, null: false
      t.string :short, null: false
      t.timestamps null: false
    end
  end
end