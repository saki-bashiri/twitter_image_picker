require 'open-uri'
module TwitterImagePicker
  class Storager
    def initialize(output_dir)
      @output_dir = output_dir
    end

    def output(url)
      open(url) do |tmp|
        File.open(file_path, "w") do |f|
          f.write(tmp.read)
        end
      end
    end

    private

    def file_path
      File.join(@output_dir, filename)
    end

    def filename
      "#{SecureRandom.urlsafe_base64}.jpg"
    end
  end
end
