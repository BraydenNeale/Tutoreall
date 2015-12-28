class Search < ActiveRecord::Base
  serialize :subjects
  serialize :availability

  def tutors
    @tutors ||= find_tutors
  end

  private

  def find_tutors
    if area.present?
      ar = Area.where("lower(name) like ?", "%#{area.downcase}%").first
    end

    tutors = Tutor.all
    tutors = tutors.includes(:areas).where('areas.id' => ar.id) if ar.present?
    # tutors = tutors.where("get_age >= ?", age) if age.present?
    # tutors = tutors.select {|t| t.get_age >= age } if age.present?
    tutors = age_filter(tutors)

    return tutors
  end

  # Age brackets - taken from tutoric
  def age_filter(tutors)
    if not age.present?
      return tutors
    end

    tutors = tutors.select {|t| t.get_age < 25 } if age == 1 # < 25
    tutors = tutors.select {|t| t.get_age >= 25 and t.get_age <= 40} if age == 2
    tutors = tutors.select {|t| t.get_age > 40} if age == 3

    # any other age value => any age is fine
    return tutors
  end
end
