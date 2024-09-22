class CreateEmpregadors < ActiveRecord::Migration[7.2]
  def change
    create_table :empregadors do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :empresa

      t.timestamps
    end
  end
end
