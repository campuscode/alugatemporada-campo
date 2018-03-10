require 'rails_helper'

feature 'user send a proposal' do
  scenario 'successfuly' do
    local = PropertyLocation.create(name: 'Santos')
    property = Property.create(
                title: 'Casa de Campo',
                description: 'Uma linda casa em Campos de Jordão',
                property_location: local,
                neighborhood: 'Campos',
                rent_purpose: 'Férias',
                main_photo: 'foto.jpg',
                rooms: 5,
                maximum_guests: 15,
                minimum_rent: 3,
                maximum_rent: 15,
                daily_rate: 200.0,
                accessibility: true,
                allow_pets: false,
                allow_smokers: true,
              )

    visit root_path
    click_on 'Ver mais detalhes'
    click_on 'Enviar uma proposta'

    fill_in 'Nome', with: 'Felix'
    fill_in 'Email', with: 'felix@email.com'
    fill_in 'Telefone', with: '121212-13131'
    fill_in 'Finalidade', with: 'Despedida de solteiro'
    fill_in 'Quantidade de hospedes', with: 12
    fill_in 'Data de entrada', with: '21/11/2018'
    fill_in 'Data de saída', with:  '28/11/2018'
    check 'Pretende levar pets?'
    check 'Fumante?'
    fill_in 'Valor da proposta', with: 200.00
    fill_in 'Mais informações', with: 'N/A'
    click_on 'Enviar'

    expect(current_path).to eq(property_path(property))
    expect(page).to have_content('Sua proposta foi enviada com sucesso!')
    expect(page).to have_css('li', text: 'Proponente: Felix')
    expect(page).to have_css('li', text: 'email do proponente: felix@email.com')
    expect(page).to have_css('li', text: 'Telefone do proponete: 121212-13131')
    expect(page).to have_css('li', text: 'Finalidade da proposta: Despedida de solteiro')
    expect(page).to have_css('li', text: 'Quantidade de hospedes: 12')
    expect(page).to have_css('li', text: 'estadia de 21/11/2018 até 28/11/2018')
    expect(page).to have_css('li', text: 'Valor da proposta: 200.0' )
    expect(page).to have_css('li', text: 'Vou levar meu pet')
    expect(page).to have_css('li', text: 'Sou fumante')
    expect(page).to have_css('li', text: 'Maiores detalhes: N/A')
  end
end