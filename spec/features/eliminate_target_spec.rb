feature 'Eliminate target' do
  let!(:assassin) { User.create(first_name: "Erika",
                               last_name: "Pheby",
                               username: "eripheebs",
                               email: "eri@gmail.com") }
  let!(:target) { User.create(first_name: "Kyle",
                               last_name: "Buttner",
                               username: "kbutt",
                               email: "kyle@gmail.com") }
  let!(:assignment) { Assignment.create(assassin_id: assassin.id,
                                        target_id: target.id)}

  scenario 'Assassin should see button to indicate target has been eliminated' do
    visit '/'
    expect(page).to have_selector('form', visible: false)
    click_button 'Reveal your target'
    click_button 'I have eliminated this target'
    expect(page).to have_content 'How did you do it?'
  end

  scenario 'Assassin should see options to describe how elimination happened' do
    visit '/'
    expect(page).to have_selector('form', visible: false)
    click_button 'Reveal your target'
    click_button 'I have eliminated this target'
    expect(page).to have_content 'How did you do it?'
    expect(page).to have_content 'Option 1'
    expect(page).to have_content 'Option 2'
    expect(page).to have_content 'Option 3'
  end

  scenario 'Assassin should see alert that form is received after elimiating target' do
    visit '/'
    click_button 'Reveal your target'
    click_button 'I have eliminated this target'
    find(:css, "input[value='Option 2']").set(true)
    click_button 'Submit'
    expect(page).to have_content 'Thanks. Please watch your email for further instructions.'
  end
end
