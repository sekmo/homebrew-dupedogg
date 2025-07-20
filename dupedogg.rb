class Dupedogg < Formula
  desc "A command-line tool to find and move similar images"
  homepage "https://github.com/sekmo/dupedogg"
  url "https://github.com/sekmo/dupedogg/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c633cf5ce3f113009288fd3a0a5664d0cd6f7f3f82731fe63a95c01a78a5a7ac"
  license "MIT"

  depends_on "python"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "."
    bin.install_symlink libexec/"bin/dupedogg" => "dupedogg"
  end

  test do
    system "#{bin}/dupedogg", "--version"
  end
end
