class CreateFetchers < ActiveRecord::Migration
  def change
    create_table :fetchers do |t|

      t.timestamps
    end
  end
end
