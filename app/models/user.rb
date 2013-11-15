class User < ActiveRecord::Base
  has_attached_file :avatar

  FILE_PATH = "#{Rails.root}/public/404.html"

  def self.file_copy(user_name: nil)
    return false if user_name.nil?

    params ={}

    avatar = ActionDispatch::Http::UploadedFile.new(tempfile: File.open(FILE_PATH))
    avatar.content_type = MIME::Types.type_for(FILE_PATH)[0].content_type
    avatar.original_filename = File.basename(FILE_PATH)

    params[:user] = {
      name: user_name,
      avatar: avatar
    }
  end
end
