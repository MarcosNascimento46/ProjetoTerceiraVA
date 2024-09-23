require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "deve listar usuários" do
    get users_url
    assert_response :success
  end

  test "deve criar usuário" do
    assert_difference('User.count') do
      post users_url, params: { user: { nome: "Novo Admin", email: "novo@example.com", password: "senha123" } }
    end
    assert_redirected_to user_path(User.last)
  end

  test "não deve criar usuário com dados inválidos" do
    assert_no_difference('User.count') do
      post users_url, params: { user: { nome: "", email: "admin@example.com", password: "senha123" } }
    end
    assert_response :unprocessable_entity
  end

  test "deve editar um usuário" do
    user = users(:one)
    patch user_url(user), params: { user: { nome: "Nome Atualizado" } }
    assert_redirected_to user_path(user)
  end

  test "deve remover um usuário" do
    user = users(:one)
    assert_difference('User.count', -1) do
      delete user_url(user)
    end
    assert_redirected_to users_url
  end
end
