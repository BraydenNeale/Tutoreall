class StaticController < ApplicationController
  # Not actually static - referring to tutors: but whatever
  def home
    # randomly display verified tutors - until we determine criteria to determine which to display
    # @tutors = Tutor.all.where(verified: true).order("RANDOM()").limit(8)
    # @tutors = Tutor.all.order("RANDOM()").limit(8)
    @tutors = Tutor.featured_tutors
  end

  def about
  end

  def privacy_policy
  end

  def terms_of_use
  end

  def how_it_works
  end

  def dispute_resolution
  end
end
