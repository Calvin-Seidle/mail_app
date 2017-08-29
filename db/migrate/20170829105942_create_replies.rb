class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.references :ticket, foreign_key: true
      t.string :from
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
