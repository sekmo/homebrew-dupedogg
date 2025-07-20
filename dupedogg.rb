class Dupedogg < Formula
  desc "A command-line tool to find and move similar images"
  homepage "https://github.com/sekmo/dupedogg"
  url "https://github.com/sekmo/dupedogg/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "30447fbd6472c1e1dae1c1e8281e735e8051a8fab9c3dc5c152c55df596f50f3"
  license "MIT"

  depends_on "python@3.12"

  resource "Pillow" do
    url "https://files.pythonhosted.org/packages/cd/74/ad3d526f3bf7b6d3f408b73fde271ec69dfac8b81341a318ce825f2b3812/pillow-10.4.0.tar.gz"
    sha256 "166c1cd4d24309b30d61f79f4a9114b7b2313d7450912277855ff5dfd7cd4a06"
  end

  resource "ImageHash" do
    url "https://files.pythonhosted.org/packages/c6/bb/1f300a41d7c4eb2aca1b6de8d4e66d7e3a2e65d1170a8e5b49ed8b420b30/ImageHash-4.3.1.tar.gz"
    sha256 "7038d1b975a34ddc09500a32f80cdc17edc3d79a29bb6c58a12ca332a0ed4b1e"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/58/83/6ba9844a41128c62e810fddddd72473201f3eacde02046066142a2d96cc5b/tqdm-4.66.5.tar.gz"
    sha256 "e1020aef2e5096702d8a025ac7d16b1577279c9d63f8375b63083e9a5f0fcbad"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/dupedogg", "--version"
  end
end
