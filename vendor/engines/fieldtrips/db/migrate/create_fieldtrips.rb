class CreateFieldtrips < ActiveRecord::Migration

  def self.up
    create_table :fieldtrips do |t|
      t.string :Name
      t.datetime :Date
      t.integer :Photo_id
      t.text :Description
      t.integer :position

      t.timestamps
    end

    add_index :fieldtrips, :id

    load(Rails.root.join('db', 'seeds', 'fieldtrips.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "fieldtrips"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/fieldtrips"})
    end

    drop_table :fieldtrips
  end

end
