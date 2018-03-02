class PlanComment < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :class_name => "Teacher"

  belongs_to :improvement_plan

  # Indirect associations

  # Validations

end
