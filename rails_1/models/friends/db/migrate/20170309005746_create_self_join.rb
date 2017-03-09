class CreateSelfJoin < ActiveRecord::Migration[5.0]
  def change
    create_table :self_joins do |t|
      t.references :user, foreign_key: true
      t.references :friend, foreign_key: true
    end
  end
end
