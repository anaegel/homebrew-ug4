# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Ugshell < Formula
  include Language::Python::Virtualenv

  desc ""
  homepage ""
  url "https://github.com/UG4/ugcore.git"
  version "0.1"
  sha256 ""

  depends_on "anaegel/repo/ughub"
  depends_on "cmake"

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
#    virtualenv_install_with_resources 
    #libexec.install Dir.glob("*")
    #bin.install_symlink libexec/"ughub" => "ughub"
    system "ughub", "init"
    system "ughub", "install", "ConvectionDiffusion"
    system "mkdir", "build"
    system "cd", "build"
    system "cmake", ".."
    
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ughub`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
     system "ughub", "help"
    system "true"
  end
end
