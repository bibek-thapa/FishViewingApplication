class CreateFish < ActiveRecord::Migration[5.2]
  def change
    create_table :fish do |t|
      t.string :genus
      t.string :commonname
      t.string :description
      t.string :thumbnail

      t.timestamps
    end
  end
end
