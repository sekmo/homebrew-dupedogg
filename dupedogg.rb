class Dupedogg < Formula
  include Language::Python::Virtualenv

  desc "A command-line tool to find and move similar images"
  homepage "https://github.com/sekmo/dupedogg"
  url "https://github.com/sekmo/dupedogg/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "297d57265e6fdd5b1569d9b7632a8cc8ace1fc4df57d8f8e8b0777c0ffb5b239"
  license "MIT"

  depends_on "python@3.12"
  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "libtiff"
  depends_on "little-cms2"
  depends_on "openjpeg"
  depends_on "webp"

  resource "Pillow" do
    url "https://files.pythonhosted.org/packages/f3/0d/d0d6dea55cd152ce3d6767bb38a8fc10e33796ba4ba210cbab9354b6d238/pillow-11.3.0.tar.gz"
    sha256 "3828ee7586cd0b2091b6209e5ad53e20d0649bbe87164a459d0676e035e8f523"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  def install
    virtualenv_create(libexec, "python3.12")
    
    # Install Pillow and tqdm without dependencies
    resource("Pillow").stage do
      system libexec/"bin/python", "-m", "pip", "install", "--no-deps", "."
    end
    resource("tqdm").stage do
      system libexec/"bin/python", "-m", "pip", "install", "--no-deps", "."
    end
    
    # Install ImageHash with dependencies (allows numpy, scipy, PyWavelets to be installed)
    system libexec/"bin/python", "-m", "pip", "install", "ImageHash==4.3.2"
    
    # Install the main package
    system libexec/"bin/python", "-m", "pip", "install", "--no-deps", "."
    
    # Create binary symlink
    bin.install_symlink libexec/"bin/dupedogg"
  end

  test do
    system "#{bin}/dupedogg", "--version"
  end
end
