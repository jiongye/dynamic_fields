class AddTestTables < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :subcategories do |t|
      t.integer :category_id
      t.string :name
      t.text :description
      t.boolean :active
      t.integer :access_level
    end

    create_table :available_languages do |t|
      t.string :name
    end

    create_table :available_languages_subcategories, :id => false do |t|
      t.integer :subcategory_id
      t.integer :available_language_id
    end
  end

  def down
    drop_table :categories
    drop_table :subcategories
    drop_table :available_languages
  end
end
