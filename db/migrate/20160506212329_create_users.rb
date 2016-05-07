class CreateUsers < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, index: true, foreign_key: true
      t.references :pin, index: true, foreign_key: true
    end
  end
end
