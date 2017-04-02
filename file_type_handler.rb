class FileTypeHandler
  attr_reader :file

  PDF_FORMATS = ['.pdf']
  VIDEO_FORMATS = [".mp4", ".avi", ".flv", ".webm", ".vob", ".mkv", ".m4v"]
  SONG_FORMATS = ['.mp3']
  IMAGE_FORMATS = ['.jpg','.jpeg']
  DOWNLOADING = ['.crdownload']


  def initialize(file)
    @file = file
  end

  def type
    case File.extname(file)
    when *PDF_FORMATS
      'PDF'
    when *VIDEO_FORMATS
      'VIDEO'
    when *SONG_FORMATS
      'SONGS'
    when *IMAGE_FORMATS
      'IMAGES'
    when *DOWNLOADING
      'DOWNLOADING'
    else
      'OTHER'
    end
  end
end
