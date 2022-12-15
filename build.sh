if which citra > /dev/null; then
    CITRA = ~/.config/citra-emu
else # assuming flatpak
    CITRA = ~/.var/app/org.citra_emu.citra/data/citra-emu
fi

java -jar ../tickompiler.jar c tickflow bin
cp -f tempo/* bin
java -jar ../tickompiler.jar p bin base.bin
mv -f C00.bin $CITRA/sdmc/rhmm