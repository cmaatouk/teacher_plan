class Comment < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :class_name => "Teacher"

  belongs_to :action_step

  # Indirect associations

  # Validations

end
