class Question < ActiveRecord::Base
  validates(:description, {:presence => true, :length => { :maximum => 50}})
  before_save(:capitalize_description)
  belongs_to(:survey)

  private

  define_method(:capitalize_description) do
    self.description=(description().capitalize())
  end
end
