refind:
	cp refind.conf /boot/EFI/BOOT/refind.conf

apps: awesome compton conkey emacs fish i3 khal mpd ranger systemd tmux vimprc xbinkeys xinitrc zathura

awesome:
	ln -s awesome ~/.config/awesome

compton:
	ln -s compton.conf  ~/.config/compton.conf

conkey:
	ln -s conkyrc_$HOSTNAME ~/.conkyrc

emacs:
	ln -s emacs ~/.emacs.d

fish:
	ln -s fish ~/.config/fish

i3:
	ln -s i3 ~/.i3

khal:
	ln -s khal ~/.khal

mpd:
	ln -s mpdconf ~/.mpdconf

ranger:
	ln -s ranger ~/.config/ranger

systemd:
	ln -s systemd ~/.config/systemd

tmux:
	ln -s tmux/tmux.conf   ~/.tmux.conf

vimprc:
	ln -s vimpcrc ~/.vimpcrc

xbinkeys:
	ln -s xbindkeysrc ~/.xbindkeysrc

xinitrc:
	ln -s xinitrc ~/.xinitrc

zathura:
	ln -s zathura ~/.zathura
