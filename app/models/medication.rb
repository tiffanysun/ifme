# == Schema Information
#
# Table name: medications
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  dosage        :integer
#  refill        :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  userid        :integer
#  total         :integer
#  strength      :integer
#  strength_unit :string(255)
#  dosage_unit   :string(255)
#  total_unit    :string(255)
#  comments      :text
#

class Medication < ActiveRecord::Base
  # dosage: amount of medication taken at one time
  # total: total quantity of medication
  # strength: strength of medication

  belongs_to :user, foreign_key: :userid

  has_one :take_medication_reminder
  has_one :refill_reminder
  accepts_nested_attributes_for :take_medication_reminder
  accepts_nested_attributes_for :refill_reminder

  validates_presence_of :name, :dosage, :refill, :userid, :total, :strength, :dosage_unit, :total_unit, :strength_unit

  validates :dosage, :numericality => { :greater_than_or_equal_to => 0 }
  validates :total, :numericality => { :greater_than_or_equal_to => 0 }
  validates :strength, :numericality => { :greater_than_or_equal_to => 0 }
end
