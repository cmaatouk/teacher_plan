class Teacher < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :foreign_key => "user_id",
             :dependent => :destroy

  has_many   :plan_comments,
             :foreign_key => "user_id",
             :dependent => :destroy

  has_many   :improvements,
             :class_name => "ImprovementPlan",
             :dependent => :destroy

  has_many   :coaches,
             :class_name => "CoachingPosition",
             :foreign_key => "user_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
