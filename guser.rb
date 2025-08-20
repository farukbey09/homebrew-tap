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
    
    # Create wrapper scripts directly in install phase
    (bin/"guser-add").write <<~EOS
      #!/bin/bash
      exec "#{bin}/guser" add "$@"
    EOS

    (bin/"guser-list").write <<~EOS
      #!/bin/bash
      exec "#{bin}/guser" list "$@"
    EOS

    (bin/"guser-switch").write <<~EOS
      #!/bin/bash
      exec "#{bin}/guser" switch "$@"
    EOS

    (bin/"guser-current").write <<~EOS
      #!/bin/bash
      exec "#{bin}/guser" current "$@"
    EOS

    (bin/"guser-remove").write <<~EOS
      #!/bin/bash
      exec "#{bin}/guser" remove "$@"
    EOS

    (bin/"guser-help").write <<~EOS
      #!/bin/bash
      exec "#{bin}/guser" help "$@"
    EOS

    # Make all scripts executable
    chmod 0755, bin/"guser"
    chmod 0755, bin/"guser-add"
    chmod 0755, bin/"guser-list" 
    chmod 0755, bin/"guser-switch"
    chmod 0755, bin/"guser-current"
    chmod 0755, bin/"guser-remove"
    chmod 0755, bin/"guser-help"
  end

  test do
    system "#{bin}/guser", "help"
  end
end
