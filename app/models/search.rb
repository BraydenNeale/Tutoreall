class Search < ActiveRecord::Base
  serialize :subjects
  serialize :availability

  enum age_brackets: ['Don\'t mind','Less than 25','26 - 40','Above 40']
  enum sex: ['Any','Female','Male']

  def tutors
    @tutors ||= find_tutors
  end

  private

  def find_tutors
    return Array.new if search_is_blank?

    tutors = Array(Tutor.all.where(verified: true))

    tutors = subjects_filter(tutors) if subjects.present?
    tutors = age_filter(tutors)
    tutors = sex_filter(tutors)
    tutors = availability_filter(tutors) if availability.present?

    if(self.area.present?)
      ar = Area.where("lower(name) like ?", "%#{self.area.downcase}%").first
      # tutors = area_filter(tutors, ar)
    end
    # presort based on ranking?

    if(ar.present?)
      tutors.sort_by! do |tut| 
        Tutor.area_sort(tut, ar)
      end
    end

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

  def area_filter(tutors, area)
    # maybe only include tutors within a cetain radius...
  end

  def subjects_filter(tutors)
    return Array(tutors.includes(:subjects).where('subjects.id' => subjects))
  end

  def availability_filter(tutors)
    ar = Array.new

    tutors.each do |tutor|
      ar.push(tutor) if not (availability & tutor.availability).empty?
    end

    return ar
  end

  def sex_filter(tutors)
    tutors = tutors.select {|t| t.Female? } if self.Female?
    tutors = tutors.select {|t| t.Male? } if self.Male?

    return tutors
  end

  def search_is_blank?
    if (
      (not (area.present? or subjects.present? or availability.present?)) and 
      age == 0  and
      sex == 0
      )

      return true;
    end

    return false;
  end
end
