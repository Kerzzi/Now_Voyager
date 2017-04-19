class CreateMicroposts < ActiveRecord::Migration[5.0]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
    #因为我们会按照发布时间的倒序检索某个用户发布的所有微博，所以在上述代码中为 user_id 和 created_at 列创建了索引
  end
end
