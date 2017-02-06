refind:
	cp $PWD/refind.conf /boot/EFI/refind/refind.conf

apps: awesome compton conkey emacs fish i3 khal mpd ranger systemd tmux vimprc xbinkeys xinitrc zathura

awesome:
	ln -s $PWD/awesome ~/.config/awesome

compton:
	ln -s $PWD/compton.conf  ~/.config/compton.conf

conkey:
	ln -s $PWD/conkyrc_$HOSTNAME ~/.conkyrc

emacs:
	ln -s $PWD/emacs ~/.emacs.d

fish:
	ln -s $PWD/fish ~/.config/fish

i3:
	ln -s $PWD/i3 ~/.i3

khal:
	ln -s $PWD/khal ~/.khal

mpd:
	ln -s $PWD/mpdconf ~/.mpdconf

ranger:
	ln -s $PWD/ranger ~/.config/ranger

systemd:
	ln -s $PWD/systemd ~/.config/systemd

tmux:
	ln -s $PWD/tmux/tmux.conf   ~/.tmux.conf

vimprc:
	ln -s $PWD/vimpcrc ~/.vimpcrc

xbinkeys:
	ln -s $PWD/xbindkeysrc ~/.xbindkeysrc

xinitrc:
	ln -s $PWD/xinitrc ~/.xinitrc

zathura:
	ln -s $PWD/zathura ~/.zathura
