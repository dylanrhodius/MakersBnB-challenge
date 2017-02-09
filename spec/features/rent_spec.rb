feature 'Renting spaces' do
  let!(:user) { User.create(email: 'johndoe@internet.com', username: 'johndoe', password: 'test', password_confirmation: 'test') }
  let!(:user2) { User.create(email: 'janedoe@internet.com', username: 'janedoe', password: 'test', password_confirmation: 'test') }

  scenario 'User can request to rent a space by picking a date and clicking on a button' do
    sign_in_list_sign_out(email: user.email, password: user.password)
    sign_in(email: user2.email, password: user2.password)
    visit '/'
    # use datepicker to pick a date here... such as 2017-11-10 (Nov 10, one day before end_date)
    # datepicker should use min and max based on this space's start and end dates.
    fill_in :request_date, with: '2017-11-10'
    click_button 'Rent'
    expect(current_path).to eq '/spaces/rent'
    expect(page).to have_content 'johndoe'
    expect(page).to have_content 'Nice condo!'
    expect(page).to have_content 'A lovely one-bedroom condo in southern France, far from foggy London.'
    expect(page).to have_content '5'
  end
end
