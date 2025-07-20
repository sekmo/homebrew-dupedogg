class Dupedogg < Formula
  include Language::Python::Virtualenv

  desc "A command-line tool to find and move similar images"
  homepage "https://github.com/sekmo/dupedogg"
  url "https://github.com/sekmo/dupedogg/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "30447fbd6472c1e1dae1c1e8281e735e8051a8fab9c3dc5c152c55df596f50f3"
  license "MIT"

  depends_on "python@3.12"

  resource "Pillow" do
    url "https://files.pythonhosted.org/packages/f3/0d/d0d6dea55cd152ce3d6767bb38a8fc10e33796ba4ba210cbab9354b6d238/pillow-11.3.0.tar.gz"
    sha256 "3828ee7586cd0b2091b6209e5ad53e20d0649bbe87164a459d0676e035e8f523"
  end

  resource "ImageHash" do
    url "https://files.pythonhosted.org/packages/cd/de/5c0189b0582e21583c2a213081c35a2501c0f9e51f21f6a52f55fbb9a4ff/ImageHash-4.3.2.tar.gz"
    sha256 "e54a79805afb82a34acde4746a16540503a9636fd1ffb31d8e099b29bbbf8156"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/dupedogg", "--version"
  end
end
