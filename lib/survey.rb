class Survey < ActiveRecord::Base
  validates(:title, {:presence => true, :length => {:maximum => 50}})
  before_save(:capitalize_title)
  has_many(:questions)

  private

  define_method(:capitalize_title) do
    self.title=(title().capitalize())
  end
end
