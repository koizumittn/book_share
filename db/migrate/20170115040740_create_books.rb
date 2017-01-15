class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string        :title
      t.text          :image_url
      t.text          :detail_url
      t.string        :auther
      t.string        :publisher
      t.integer       :user_id
      t.timestamps null: false
    end
  end
end
