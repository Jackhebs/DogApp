class ChangeDataTypeForBirthdate < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
    change_column :dogs, :birthdate, :date do |c|
    dir.up {c.change :birthdate, date}
  end
  end
  end
end
