feature 'Static pages' do
  scenario 'index page should allow redirect to sign up' do
    visit '/'
    expect(page).to have_button "Join existing team"
  end
end
