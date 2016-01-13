class Search < ActiveRecord::Base
  serialize :subjects
  serialize :availability

  enum age_brackets: ['Don\'t mind','Less than 25','26 - 40','Above 40']

  def tutors
    @tutors ||= find_tutors
  end

  private

  def find_tutors
    if not (area.present? or subjects.present? or availability.present?)
      return Array.new
    end

    tutors = Tutor.all.where(verified: true)

    filter1 = filter2 = filter3 = Array(tutors)

    filter1 = areas_filter(tutors) if area.present?
    filter2 = subjects_filter(tutors) if subjects.present?
    filter3 = availability_filter(tutors) if availability.present?

    tutors = filter1 & filter2 & filter3
    tutors = age_filter(tutors) if age.present?

    return tutors
  end

  # Age brackets - taken from tutoric
  def age_filter(tutors)
    tutors = tutors.select {|t| t.get_age < 25 } if age == 1 # < 25
    tutors = tutors.select {|t| t.get_age >= 25 and t.get_age <= 40} if age == 2
    tutors = tutors.select {|t| t.get_age > 40} if age == 3

    # any other age value => any age is fine
    return tutors
  end

  def areas_filter(tutors)
    ar = Area.where("lower(name) like ?", "%#{area.downcase}%").first

    if ar.present?
      return Array(tutors.includes(:areas).where('areas.id' => ar.id)) 
    end

    return Array.new
  end

  def subjects_filter(tutors)
    return Array(tutors.includes(:subjects).where('subjects.id' => subjects))
  end

  # Not currently working - but need to refactor the whole week day model of tutors
  def availability_filter(tutors)
    # return tutors
    return Array(tutors)
    # return Array(tutors.includes(:weekdays).where('weekdays.id' => availability))
  end
end
