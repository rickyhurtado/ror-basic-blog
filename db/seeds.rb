require 'faker'
I18n.reload!

# Create the respective blogs
sports_blog = Blog.create(name: 'Sports', privacy: 'public')
nutrition_blog = Blog.create(name: 'Nutrition' , privacy: 'public')
private_blog = Blog.create(name: 'Private', privacy: 'private')

# Create admins for blogs
sports_admin = User.create!(
  firstname: 'Sports', lastname: 'Admin', role: 'admin',
  email: 'sports_admin@example.com', blog_id: sports_blog.id,
  password: 'p4ssw0rd', password_confirmation: 'p4ssw0rd'
)

nutrition_admin = User.create!(
  firstname: 'Nutrition', lastname: 'Admin', role: 'admin',
  email: 'nutrition_admin@example.com', blog_id: nutrition_blog.id,
  password: 'p4ssw0rd', password_confirmation: 'p4ssw0rd'
)

private_admin = User.create!({
  firstname: 'Private', lastname: 'Admin', role: 'admin',
  email: 'private_admin@example.com', blog_id: nutrition_blog.id,
  password: 'p4ssw0rd', password_confirmation: 'p4ssw0rd'
})

# Create editors for blogs
sports_editor = User.create!(
  firstname: 'Sports', lastname: 'Editor',
  role: 'editor', blog_id: sports_blog.id,
  email: 'sports_editor@example.com',
  password: 'p4ssw0rd', password_confirmation: 'p4ssw0rd'
)

nutrition_editor = User.create!(
  firstname: 'Nutrition', lastname: 'Editor',
  role: 'editor', blog_id: nutrition_blog.id,
  email: 'nutrition_editor@example.com',
  password: 'p4ssw0rd', password_confirmation: 'p4ssw0rd'
)

# Create posts to respective blogs
2.times do
  sports_admin.posts.create(
    title: [Faker::Sports::Basketball.team, Faker::Sports::Football.team].sample,
    body: Faker::Lorem.paragraph(sentence_count: (100...500)),
    blog: sports_blog
  )
end

5.times do
  sports_editor.posts.create(
    title: [Faker::Sports::Basketball.team, Faker::Sports::Football.team].sample,
    body: Faker::Lorem.paragraph(sentence_count: (100...500)),
    blog: sports_blog
  )
end

1.times do
  nutrition_admin.posts.create(
    title: [Faker::Food.fruits, Faker::Food.vegetables].sample,
    body: Faker::Lorem.paragraph(sentence_count: (100...500)),
    blog: nutrition_blog
  )
end

3.times do
  nutrition_editor.posts.create(
    title: [Faker::Food.fruits, Faker::Food.vegetables].sample,
    body: Faker::Lorem.paragraph(sentence_count: (100...500)),
    blog: nutrition_blog
  )
end

2.times do
  private_admin.posts.create(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph(sentence_count: (100...500)),
    blog: private_blog
  )
end
