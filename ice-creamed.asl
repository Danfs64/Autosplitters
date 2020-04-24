state("Projector") {
    /** Just like the Zed one, I found multiple addresses for the same thing.
     *  This time though, I found only one address with multiple pointer paths to it.
     *  I'll document here all the adress I found with up to 3 offsets.
     */

    int levelCounter : "proj.dll", 0x10094, 0x54C, 0x14, 0x370;
    // int levelCounter : "proj.dll", 0x10094, 0x54C, 0x28, 0xD70;
    // int levelCounter : "proj.dll", 0x10094, 0x554, 0x0,  0x350;
    // int levelCounter : "proj.dll", 0x10094, 0x554, 0x28, 0x370;
    // int levelCounter : "proj.dll", 0x10094, 0x558, 0x14, 0x350;
    // int levelCounter : "proj.dll", 0x10094, 0x57C, 0x28, 0x350;
    // int levelCounter : "proj.dll", 0x10258, 0x48,  0x0,  0xD70;
    // int levelCounter : "proj.dll", 0x10258, 0x4C,  0x0,  0x370;
    // int levelCounter : "proj.dll", 0x10258, 0x4C,  0x14, 0xD70;
}

init {}

start {}

split {
    return current.levelCounter > old.levelCounter;
}

isLoading {}

gameTime {}
