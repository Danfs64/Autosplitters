state("flashplayer_32_sa") {
    /** For some reason, the flash player have 4 (or at least, I found 4)
     *  different variables that increment every time a new level is loaded.
     *  But weird is, not all of then increment 1-by-1, and some even make 
     *  another increment or decrement after some (apparently random) time.
     */

    /** I'll have all of the found addresses noted here, but I decided to use 
     *  the one that decrements randomly, because I'll only use '>' for
     *  comparisons and he appears to be the one that "behaves" more properly.
     *  (rarely, the 1-by-1 addresses just go nuts for no apparent reason)
     */

    // int levelIncrement : "wininet.dll", 0x41E3E4; // Increments by 1
    int levelIncrement : "wininet.dll", 0x41EB04; // Increments by 3 and then decrements by 1
    // int levelIncrement : "wininet.dll", 0x41F480; // Increments by 17 and then increments by 1
    // int levelIncrement : "wininet.dll", 0x421300; // Increments by 1
}

init {}

start {}

split {
    return current.levelIncrement > old.levelIncrement;
}

isLoading {}

gameTime {}
