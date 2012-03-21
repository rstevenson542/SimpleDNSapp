class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.string :email
      t.integer :ttl
      t.text :comment

      t.timestamps
    end
  end
end
