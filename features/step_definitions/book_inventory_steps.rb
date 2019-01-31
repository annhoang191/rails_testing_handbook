Given "I have populated my inventory with several books" do
  FactoryBot.create(:book,
    user: @registered_user,
    name: "Don Quixote",
    author: "Miguel de Cervantes")
  FactoryBot.create(:book,
    user: @registered_user,
    name: "Moby Dick",
    author: "Herman Melville")
end

Then "I should see the list of my books" do
  expect(page).to have_content("Don Quixote")
  expect(page).to have_content("Moby Dick")
end

When "I submit a new book to my inventory" do
  click_link "New Book"
  fill_in "book_name", with: "War and Peace"
  fill_in "book_author", with: "Leo Tolstoy"
  click_button "Create Book"
end

Then "I should see the new book in my inventory" do
  visit root_path
  expect(page).to have_content("War and Peace")
  expect(page).to have_content("Leo Tolstoy")
end

Given "I have a book in my inventory" do
  FactoryBot.create(:book,
    user: @registered_user,
    name: "War and Peace",
    author: "Leo Tolstoy")
end

When "I change the title of my book" do
  visit root_path
  click_link "Edit"
  fill_in "book_name", with: "New title"
  click_button "Update Book"
end

Then "I should see the book with the new title in my inventory" do
  expect(page).to_not have_content("War and Peace")
  expect(page).to have_content("New title")
end

When "I remove a book from my inventory" do
  visit root_path
  click_link "Destroy"
end

Then "I should not see it listing in my inventory anymore" do
  expect(page).to_not have_content("War and Peace")
end
