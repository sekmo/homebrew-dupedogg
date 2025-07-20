class Dupedogg < Formula
  include Language::Python::Virtualenv

  desc "A command-line tool to find and move similar images"
  homepage "https://github.com/sekmo/dupedogg"
  url "https://github.com/sekmo/dupedogg/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6f68a0294914cfb05ce15b85a35b3c6b6037ec1842a375e8aeb8cbea7c0cbbb2"
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

  resource "ImageHash" do
    url "https://files.pythonhosted.org/packages/cd/de/5c0189b0582e21583c2a213081c35a2501c0f9e51f21f6a52f55fbb9a4ff/ImageHash-4.3.2.tar.gz"
    sha256 "e54a79805afb82a34acde4746a16540503a9636fd1ffb31d8e099b29bbbf8156"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/2e/19/d7c972dfe90a353dbd3efbbe1d14a5951de80c99c9dc1b93cd998d51dc0f/numpy-2.3.1.tar.gz"
    sha256 "1ec9ae20a4226da374362cca3c62cd753faf2f951440b0e3b98e93c235441d2b"
  end

  resource "PyWavelets" do
    url "https://files.pythonhosted.org/packages/48/45/bfaaab38545a33a9f06c61211fc3bea2e23e8a8e00fedeb8e57feda722ff/pywavelets-1.8.0.tar.gz"
    sha256 "f3800245754840adc143cbc29534a1b8fc4b8cff6e9d403326bd52b7bb5c35aa"
  end

  resource "scipy" do
    url "https://files.pythonhosted.org/packages/81/18/b06a83f0c5ee8cddbde5e3f3d0bb9b702abfa5136ef6d4620ff67df7eee5/scipy-1.16.0.tar.gz"
    sha256 "b5ef54021e832869c8cfb03bc3bf20366cbcd426e02a58e8a58d7584dfbb8f62"
  end

  def install
    virtualenv_create(libexec, "python3.12")
    
    # Install resources
    resource("Pillow").stage { system libexec/"bin/python", "-m", "pip", "install", "." }
    resource("ImageHash").stage { system libexec/"bin/python", "-m", "pip", "install", "." }
    resource("tqdm").stage { system libexec/"bin/python", "-m", "pip", "install", "." }
    resource("numpy").stage { system libexec/"bin/python", "-m", "pip", "install", "." }
    resource("PyWavelets").stage { system libexec/"bin/python", "-m", "pip", "install", "." }
    resource("scipy").stage { system libexec/"bin/python", "-m", "pip", "install", "." }
    
    # Install the main package
    system libexec/"bin/python", "-m", "pip", "install", "."
    
    # Create binary symlink
    bin.install_symlink libexec/"bin/dupedogg"
  end

  test do
    system "#{bin}/dupedogg", "--version"
  end
end
