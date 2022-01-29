require "./spec_helper"

describe File do
  describe ".fifo" do
    it "creates a filesystem entry (but not a file)" do
      path = File.tempname
      File.mkfifo(path)
      File.exists?(path).should eq(true)
      File.file?(path).should eq(false)
      File.delete(path)
    end

    it "the result can be read" do
      path = File.tempname
      File.mkfifo(path)
      File.readable?(path).should eq(true)
      File.delete(path)
    end

    it "the result can be written to" do
      path = File.tempname
      File.mkfifo(path)
      File.writable?(path).should eq(true)
      File.delete(path)
    end
  end

  describe ".fifo?" do
    it "is false for a normal file" do
      File.tempfile do |file|
        File.fifo?(file.path).should eq(false)
      end
    end

    it "is false for a directory" do
      path = File.tempname
      Dir.mkdir_p(path)
      File.fifo?(path).should eq(false)
      Dir.delete(path)
    end

    it "is true for a fifo" do
      path = File.tempname
      File.mkfifo(path)
      File.fifo?(path).should eq(true)
      File.delete(path)
    end
  end
end
