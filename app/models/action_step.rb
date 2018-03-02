class ActionStep < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  belongs_to :goal

  # Indirect associations

  # Validations

end
