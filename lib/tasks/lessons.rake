# desc "Change state of lessons for which the date has passed"
# task :check_lesson_completion => :environment do 
#   Lesson.all.where(state < completed) do |lesson|
#     if lesson.date < date.now
#       if lesson.payed
#         lesson.pay-complete
#       else
#         lesson.complete
#       end
#     end
#   end
# end