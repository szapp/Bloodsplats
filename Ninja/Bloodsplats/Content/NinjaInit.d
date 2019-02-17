/*
 * Call this function (from the function "Ninja_Bloodsplats_Init" below) to initialize LeGo packages.
 *
 * It ensures that all necessary LeGo packages will be loaded without breaking already loaded LeGo packages.
 *
 * Caution: When re-using this function elsewhere, it is important to rename it to prevent clashes!
 * Each patch that needs it, has to have their own function with a unique name. Otherwise they cannot be stacked.
 *
 * Do not modify this function in any way!
 */
func void Ninja_Bloodsplats_MergeLeGoFlags(var int flags) {
    const int legoInit    = -1; // Prior initialization state
    const int initialized =  0; // Once per session
    var   int loaded;           // Once per game save
    legoInit    = LeGo_MergeFlags(flags, legoInit, initialized, loaded);
    initialized = 1;
    loaded      = 1;
};


/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_Bloodsplats_Init() {
    // Wrapper for "LeGo_Init" to ensure correct LeGo initialization without breaking the mod
    Ninja_Bloodsplats_MergeLeGoFlags(/* LeGo_Bloodsplats = */ LeGo_FrameFunctions | LeGo_Random | LeGo_Anim8);

    // Replace LeGo_Bloodsplats initialization with a volatile hook to prevent writing the FF permanently to game saves
    if (!(_LeGo_Flags & LeGo_Bloodsplats)) {
        HookEngineF(oCGame__Render, 7, _Bloodsplats_Loop);
        _LeGo_Flags = _LeGo_Flags | LeGo_Bloodsplats;
    };
};
