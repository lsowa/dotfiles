# organizing my dotfiles
clone into repo:
```
mkdir ~/tmp_dotf
git clone --separate-git-dir ~/.dotfiles https://github.com/lsowa/dotfiles.git ~/tmp_dotf
mv ~/tmp_dotf/* ~
rm ~/tmp_dotf
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotf config status.showUntrackedFiles no
```

checkout:  
https://martijnvos.dev/using-a-bare-git-repository-to-store-linux-dotfiles/
 
