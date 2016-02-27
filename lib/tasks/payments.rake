desc "export a csv file of all payments to be processed this week to s3"
task :export_payments_csv do
  require 'csv'
  # Generate arrays with required data
  CSV.open("payment_csv_#{Date.today.strftime("%Y-%m-%d")}.csv","w") do |csv|
    Payments.each.where(processed: false) do |pay|
      if pay.lesson.date < date.today
        if pay.lesson.completed?
          csv << [pay.provider.bank_account.bsb, pay.provider.bank_account.number, pay.provider.bank_account.name, pay.get_value]
        # cancelled - refund? refund - remove?
        end
      end
    end
  end
end

desc "Download a .aba file of all payments to be processed this week to s3"
task :export_payments_aba do 
  puts "Not implemented"
end

