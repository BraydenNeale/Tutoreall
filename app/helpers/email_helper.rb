module EmailHelper
  def email_image_tag(image, **options)
    attachments[image] = {
        # :data => File.read(Rails.root.join("app/assets/images/emails/#{image}")),
        :data => File.read(Rails.root.join("app/assets/images/layout/#{image}")),
        :mime_type => "image/png"
        # :encoding => "base64"
    }
    image_tag attachments[image].url, **options

    # attachments[image] = File.read(Rails.root.join("app/assets/images/layout/#{image}"))
  end
end
