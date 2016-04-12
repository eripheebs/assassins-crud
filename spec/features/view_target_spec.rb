feature 'View target' do
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

  scenario 'Assassin should have button to see target name on index page' do
    visit '/'
    click_button 'View your target'
    expect(page).to have_content 'Kyle Buttner'
  end
end
