class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true
      t.string :content
      t.references :user

      t.timestamps
    end
  end
end
