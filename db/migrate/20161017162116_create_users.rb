class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end

Сlass CreateUsersCartProductJoinTable < ActiveRecord::Migration[5.0]
def change
  create_join_table :products, :carts do |t|
    t.index :pr
    t.integer :age

    t.timestamps
  end
end
end