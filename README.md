# jaydub macOS setup scripts

```sh
git clone https://github.com/jaydub72/macos-setup/ ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

# automate the setup of a MacOS system (iMac or Macbook Pro)

After reading and playing with Holman's dotfiles and Mathias's dotfiles, I
finally built my own set of install scripts and dotfiles.   This setup may
not suit you at all but it works for me!

Feel free to take advantage of any of these scripts/dotfiles for your own
personal use.

# github

In order to ensure github works correctly with editors and in shell commands,
make sure that you use the Personal Access Token for the passcode and not the
github username and password combination.

# topical subdirectories

I straight up stole Holman's approach to structured topical areas.  It is
clean and easy to manage this way.  If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.
