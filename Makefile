pwd=$(shell pwd)

refind:
	cp refind.conf /boot/EFI/BOOT/refind.conf

pacman_kernel_update_hook:
	ln -s ${pwd}/pacman_hooks/ /etc/pacman.d/hooks.d

apps: awesome compton conkey emacs fish i3 khal mpd ranger systemd tmux unison vimprc xbinkeys xinitrc zathura

awesome:
	ln -s ${pwd}/awesome ~/.config/awesome

compton:
	ln -s ${pwd}/compton.conf  ~/.config/compton.conf

conkey:
	ln -s ${pwd}/conkyrc_$HOSTNAME ~/.conkyrc

emacs:
	ln -s ${pwd}/emacs ~/.emacs.d

fish:
	ln -s ${pwd}/fish ~/.config/fish

i3:
	ln -s ${pwd}/i3 ~/.i3

khal:
	ln -s ${pwd}/khal ~/.khal

mpd:
	ln -s ${pwd}/mpdconf ~/.mpdconf

ranger:
	ln -s ${pwd}/ranger ~/.config/ranger

systemd:
	ln -s ${pwd}/systemd ~/.config/systemd

tmux:
	ln -s ${pwd}/tmux/tmux.conf   ~/.tmux.conf

unison:
	ln -s ${pwd}/unison ~/.unison

vimprc:
	ln -s ${pwd}/vimpcrc ~/.vimpcrc

xbinkeys:
	ln -s ${pwd}/xbindkeysrc ~/.xbindkeysrc

xinitrc:
	ln -s ${pwd}/xinitrc ~/.xinitrc

zathura:
	ln -s ${pwd}/zathura ~/.zathura
