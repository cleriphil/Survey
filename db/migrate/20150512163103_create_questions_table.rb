class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table(:questions) do |t|
      t.column(:description, :string)
      t.column(:survey_id, :integer)

      t.timestamps()
    end
  end
end
