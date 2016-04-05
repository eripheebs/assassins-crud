feature 'Navbar' do
  scenario 'should render on index page' do
    visit '/'
    expect(page).to have_content
  end
end
