class CreateArchetypeArticles < ActiveRecord::Migration
  def change
    create_table :archetype_articles do |t|
      t.integer :archetype_id
      t.integer :article_id

      t.timestamps
    end
  end
end
