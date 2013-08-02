require 'formula'

class Rbenv < Formula
  homepage 'https://github.com/sstephenson/rbenv'
  head 'https://github.com/sstephenson/rbenv.git', :branch => 'develop', :revision => 'db143bb654fe447a462b0d91ba931e0524f234f7'
  
  def install
    inreplace 'libexec/rbenv', '/usr/local', HOMEBREW_PREFIX
    prefix.install Dir['*']
  end

  def caveats; <<-EOS.undent
    To use Homebrew's directories rather than ~/.rbenv add to your profile:
      export RBENV_ROOT=#{var}/rbenv

    To enable shims and autocompletion add to your profile:
      if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
    EOS
  end
end
