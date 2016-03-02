desc "export a csv file of all payments to be processed this week to s3"
task :export_payments_csv => :environment do
  require 'csv'
  # Generate arrays with required data
  file_path = "payments_export_#{Date.today.strftime("%Y-%m-%d")}.csv"
  CSV.open(file_path,"w") do |csv|
    Payment.all.where(processed: false).each do |pay|
      if pay.lesson.date < Date.today
        puts "checking lesson"
        if pay.lesson.completed?
          puts "lesson completed adding to csv"
          csv << [pay.bank_account.bsb, pay.bank_account.number, pay.bank_account.name, pay.get_value]
          pay.processed = true
          # pay.lesson.archive! - lesson has been processed
          pay.save!
        # cancelled - refund? refund - remove?
        end
      end
    end

    # Store csv in s3
    uploader = PaymentUploader.new
    uploader.store!(csv)
  end

  # Email csv to Chris - test env wil be caught by mailcatcher
  PaymentMailer.csv_export(file_path).deliver
  File.delete(file_path)
end

desc "Download a .aba file of all payments to be processed this week to s3"
task :export_payments_aba do 
  puts "Not implemented"
end