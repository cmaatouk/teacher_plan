class ImprovementPlan < ApplicationRecord
  # Direct associations

  has_many   :coaches,
             :class_name => "CoachingPosition",
             :dependent => :destroy

  has_many   :goals,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
