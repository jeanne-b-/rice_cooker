class User < ActiveRecord::Base
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :user
end

#migrations
class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table(:users) {|t| t.string :login; t.string :email}
    create_table(:comments) {|t| t.integer :user_id; t.string :content}
  end
end

ActiveRecord::Migration.verbose = false
CreateAllTables.up

[
  {login: "andre", email: "tata"},
  {login: "mathieu", email: "toto"},
  {login: "bobol", email: "titi"},
  {login: "fred", email: "gratti"},
  {login: "jeanne", email: "zapata"},
  {login: "angie", email: "tutu"}
].each{|u| User.create!(u)}