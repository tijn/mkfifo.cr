class File
  def self.mkfifo(path : Path | String, mode = 0o777) : Nil
    LibC.mkfifo(path.to_s, mode)
  end

  def self.fifo?(path : Path | String) : Bool
    if info = info?(path)
      info.type.pipe?
    else
      false
    end
  end
end
