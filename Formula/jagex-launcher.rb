class JagexLauncher < Formula
  desc "Jagex Launcher"
  homepage "https://www.jagex.com"
  url "https://cdn.jagex.com/Jagex%20Launcher%20Installer.dmg"
  sha256 "fff5b5f4727fc5307f756c8bfa8b0831910cbefc960888d9bc94dabbddc3db56" 
  version "1.0.0" 

  def install
    dmg_name = "JagexLauncherInstaller.dmg"
    system "curl", "-o", dmg_name, url
    system "hdiutil", "attach", dmg_name
    system "cp", "-r", "/Volumes/Jagex\ Launcher\ Installer/Jagex\ Launcher.app", "#{prefix}/Jagex\ Launcher.app"
    system "hdiutil", "detach", "/Volumes/Jagex\ Launcher\ Installer"
    bin.install_symlink "#{prefix}/Jagex\ Launcher.app/Contents/MacOS/Jagex\ Launcher" => "jagex-launcher"
  end

  def caveats
    <<~EOS
      To launch Jagex Launcher, you can run:
        jagex-launcher
    EOS
  end

  test do
    system "false"
  end
end

