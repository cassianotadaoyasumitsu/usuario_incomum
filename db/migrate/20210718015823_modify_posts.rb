class ModifyPosts < ActiveRecord::Migration[6.0]
  def change
    posts = Post.all

    posts.each do |post|
      post.value.gsub!('¥', '')
      post.save
    end
  end
end
