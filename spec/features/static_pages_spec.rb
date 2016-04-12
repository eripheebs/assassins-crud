feature 'Static pages' do
  scenario 'index page should allow user to join new team' do
    visit '/'
    expect(page).to have_button "Join existing team"
  end

  scenario 'should have an about page' do
    visit '/about'
    expect(page).to have_content "About Assassins Crud"
  end
end
