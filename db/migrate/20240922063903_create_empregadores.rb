class CreateEmpregadores < ActiveRecord::Migration[7.2]
  def change
    create_table :empregadores do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :empresa

      t.timestamps
    end
  end
end
