class ImprovementPlan < ApplicationRecord
  # Direct associations

  has_many   :goals,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
