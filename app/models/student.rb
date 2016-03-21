# == Schema Information
#
# Table name: students
#
#  id           :integer          not null, primary key
#  section_id   :integer
#  house_id     :integer
#  roll_number  :integer
#  name         :string
#  fathers_name :string
#  gender       :string
#  email        :string
#  dob          :date
#  phone        :string
#  address      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Student < ActiveRecord::Base
  module Gender
    MALE   = {code: 1, label: "Male"}
    FEMALE = {code: 2, label: "Female"}

    def self.label(code)
     if code.to_i == MALE[:code]
       return MALE[:label]
     else
       return FEMALE[:label]
     end
    end

    def self.all
     [MALE, FEMALE].collect{|hsh| OpenStruct.new(hsh)}
    end
  end

  belongs_to :section
  belongs_to :house

  before_create :set_rollnumber

private
  def set_rollnumber
    return if self.roll_number

    students = self.section.students
    if students.count <= 1
      self.roll_number = 1
    else
      self.roll_number = students[-2].roll_number.to_i + 1
    end
  end
end
