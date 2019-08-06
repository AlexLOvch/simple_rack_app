class AddUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, index: { unique: true }
    end
  end
end