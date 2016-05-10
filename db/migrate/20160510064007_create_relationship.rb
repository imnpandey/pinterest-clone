class CreateRelationship < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :follower, index: true, foreign_key: true
      t.belongs_to :followed, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
