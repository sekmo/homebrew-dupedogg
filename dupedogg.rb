class Dupedogg < Formula
  desc "A command-line tool to find and move similar images"
  homepage "https://github.com/sekmo/dupedogg"
  url "https://github.com/sekmo/dupedogg/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "30447fbd6472c1e1dae1c1e8281e735e8051a8fab9c3dc5c152c55df596f50f3"
  license "MIT"

  depends_on "python"

  def install
    system "python3", *Language::Python.setup_install_args(libexec)
    bin.install_symlink libexec/"bin/dupedogg" => "dupedogg"
  end

  test do
    system "#{bin}/dupedogg", "--version"
  end
end
