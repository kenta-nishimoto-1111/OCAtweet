class AddUserToTweets < ActiveRecord::Migration[6.0]
  def change
    add_reference :tweets, :User, null: false, foreign_key: true
  end
end
