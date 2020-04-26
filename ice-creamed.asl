state("Projector") {
    /** Just like the Zed one, I found multiple addresses for the same thing.
     *  This time though, I found only one address with multiple pointer paths to it.
     *  I'll document multiple addresses for each fuction, just to be sure.
     */

    // I hope the name explains itself
    int levelNumber : "proj.dll", 0x10094, 0x54C, 0x14, 0x370;
    // int levelNumber : "proj.dll", 0x10094, 0x54C, 0x28, 0xD70;
    // int levelNumber : "proj.dll", 0x10094, 0x554, 0x0,  0x350;
    // int levelNumber : "proj.dll", 0x10094, 0x554, 0x28, 0x370;
    // int levelNumber : "proj.dll", 0x10094, 0x558, 0x14, 0x350;
    // int levelNumber : "proj.dll", 0x10094, 0x57C, 0x28, 0x350;
    // int levelNumber : "proj.dll", 0x10258, 0x48,  0x0,  0xD70;
    // int levelNumber : "proj.dll", 0x10258, 0x4C,  0x0,  0x370;
    // int levelNumber : "proj.dll", 0x10258, 0x4C,  0x14, 0xD70;

    // True only on end menu or start menu, False otherwise
    bool onMenu : "IML32.dll", 0x97D00;

    // 'playing' is 0 until you make an input, then it will be 24 until you reset the game
    int playing : "DIRECTOS.X32", 0x4B44, 0x85C;
    // int playing : 0x64C0, 0x10, 0x40, 0x50, 0xFE8;
    // int playing : 0x64C0, 0x10, 0x40, 0x60, 0xFE8;
}

init {}

start {
    // The 'old == 0' is to make sure that the timer won't start if you reset the timer in-game
    return old.playing == 0 && current.playing == 24;
}

split {
    // If it is already at level 3, split on end menu
    if (old.levelNumber == 3) return current.onMenu;

    else return current.levelNumber > old.levelNumber;
}

isLoading {}

gameTime {}
