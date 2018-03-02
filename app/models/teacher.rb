class Teacher < ApplicationRecord
  # Direct associations

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
