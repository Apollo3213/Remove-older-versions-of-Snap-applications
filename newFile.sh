set -eu
sudo apt-get autoremove  
sudo du -sh /var/cache/apt 
sudo apt-get autoclean
sudo apt-get clean
journalctl --disk-usage
sudo journalctl --vacuum-time=3d
du -sh ~/.cache/thumbnails
rm -rf ~/.cache/thumbnails/*


#removes old revisions of snaps
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done

