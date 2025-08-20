class Guser < Formula
  desc "🚀 Easy management of git user profiles with simple commands"
  homepage "https://github.com/farukbey09/guser"
  url "https://github.com/farukbey09/guser/archive/v1.0.0.tar.gz"
  sha256 "2f850e32490e234fc218e9665ed78ffabadbf396289c96abbf134c92d134d5e4"
  license "MIT"

  depends_on "python@3.9"

  def install
    # Install the main script as guser
    bin.install "git-user-manager.py" => "guser"
    
    # Create and install wrapper scripts for convenience
    %w[add list switch current remove help].each do |cmd|
      (buildpath/"guser-#{cmd}").write <<~EOS
        #!/bin/bash
        exec "#{HOMEBREW_PREFIX}/bin/guser" #{cmd} "$@"
      EOS
      bin.install "guser-#{cmd}"
    end
  end

  test do
    system "#{bin}/guser", "help"
  end
end
