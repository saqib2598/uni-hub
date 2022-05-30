class UnihubApplication < ApplicationRecord
  belongs_to :user
  belongs_to :country

  enum status: {
    submitted: 0,
    processing: 1,
    university_accepted: 2,
    visa_processing: 3,
    visa_approved: 4
  }

  enum current_qualification: {
    intermediate: 0,
    bachelors: 1,
    masters: 2
  }

  enum interested_qualification: {
    foundation: 0,
    diploma: 1,
    undergraduate: 2,
    graduate: 3
  }
end
