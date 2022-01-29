class File
  def self.mkfifo(path : Path | String, mode = 0o777) : Nil
    LibC.mkfifo(path.to_s, mode)
  end
end
