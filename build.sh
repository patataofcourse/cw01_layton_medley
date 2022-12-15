if which citra >&2 2> /dev/null; then
    CITRA_DIR=~/.config/citra-emu
    CITRA=citra
else # assuming flatpak
    CITRA_DIR=~/.var/app/org.citra_emu.citra/data/citra-emu
    CITRA="flatpak run org.citra_emu.citra"
fi

java -jar ../tickompiler.jar c tickflow bin || exit 1
cp -rf tempo/* bin/
java -jar ../tickompiler.jar p bin base.bin || exit 1
cp -f C00.bin $CITRA_DIR/sdmc/rhmm

$CITRA