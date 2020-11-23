class CreateFinancialPlanners < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_planners do |t|
      t.string :name
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
