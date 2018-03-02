class ActionStep < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  belongs_to :goal

  # Indirect associations

  has_many   :users,
             :through => :comments,
             :source => :user

  # Validations

end
