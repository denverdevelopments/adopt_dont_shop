require 'rails_helper'

RSpec.describe 'application creation' do
  describe 'the application new' do
    it 'renders the new form' do
      visit "/applications/new"

      expect(page).to have_content('New Application')
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Address')
      expect(find('form')).to have_content('City')
      expect(find('form')).to have_content('State')
      expect(find('form')).to have_content('Zip code')
      expect(page).to have_button('Create New')
    end
  end

  describe 'the application create' do
    context 'given valid data' do
      it 'creates the application and redirects to the applications index' do
        visit "/applications/new"

        fill_in 'Name', with: 'First Last'
        fill_in 'Address', with: '123 St'
        fill_in 'City', with: 'Denver'
        fill_in 'State', with: 'CO'
        fill_in 'Zip code', with: '80222'
        click_button 'Create New'
        expect(page).to have_current_path("/applications/#{Application.last.id}")
        expect(page).to have_content('First Last')
      end
    end

    context 'given invalid data' do
      it 're-renders the new form' do
        visit "/applications/new"

        click_button 'Create New'
        expect(page).to have_current_path("/applications")
        expect(page).to have_content("ERROR: Name can't be blank, Address can't be blank, City can't be blank, State can't be blank, Zip code can't be blank")
      end
    end
  end
end
