feature 'Bookmarks page test' do
  scenario 'the page shows bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'https://www.google.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'https://www.wikipedia.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.reddit.com');")

    visit('/')
    click_button 'See bookmarks'
    expect(page).to have_content 'https://www.google.com'
    expect(page).to have_content 'https://www.wikipedia.com'
    expect(page).to have_content 'https://www.reddit.com'
  end
end
