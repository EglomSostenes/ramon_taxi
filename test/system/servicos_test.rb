require "application_system_test_case"

class ServicosTest < ApplicationSystemTestCase
  setup do
    @servico = servicos(:one)
  end

  test "visiting the index" do
    visit servicos_url
    assert_selector "h1", text: "Servicos"
  end

  test "creating a Servico" do
    visit servicos_url
    click_on "New Servico"

    fill_in "Datetime", with: @servico.DateTime
    fill_in "Email", with: @servico.email
    fill_in "Fone", with: @servico.fone
    fill_in "Nome", with: @servico.nome
    click_on "Create Servico"

    assert_text "Servico was successfully created"
    click_on "Back"
  end

  test "updating a Servico" do
    visit servicos_url
    click_on "Edit", match: :first

    fill_in "Datetime", with: @servico.DateTime
    fill_in "Email", with: @servico.email
    fill_in "Fone", with: @servico.fone
    fill_in "Nome", with: @servico.nome
    click_on "Update Servico"

    assert_text "Servico was successfully updated"
    click_on "Back"
  end

  test "destroying a Servico" do
    visit servicos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Servico was successfully destroyed"
  end
end
