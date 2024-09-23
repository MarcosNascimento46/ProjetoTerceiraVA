require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "deve salvar usuário válido" do
    user = User.new(nome: "Administrador", email: "admin@example.com", password: "senha123")
    assert user.save
  end

  test "não deve salvar usuário sem nome" do
    user = User.new(email: "admin@example.com", password: "senha123")
    assert_not user.save
  end

  test "não deve salvar usuário sem email" do
    user = User.new(nome: "Administrador", password: "senha123")
    assert_not user.save
  end

  test "não deve salvar usuário com email inválido" do
    user = User.new(nome: "Administrador", email: "emailinvalido", password: "senha123")
    assert_not user.save
  end

  test "deve salvar usuário com email válido" do
    user = User.new(nome: "Administrador", email: "admin@example.com", password: "senha123")
    assert user.valid?
  end
end
