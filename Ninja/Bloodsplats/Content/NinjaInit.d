/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_Bloodsplats_Init() {
    // Wrapper for "LeGo_Init" to ensure correct LeGo initialization without breaking the mod
    LeGo_MergeFlags(/* LeGo_Bloodsplats = */ LeGo_FrameFunctions | LeGo_Random | LeGo_Anim8);

    // Replace LeGo_Bloodsplats initialization with a volatile hook to prevent writing the FF permanently to game saves
    if (!(_LeGo_Flags & LeGo_Bloodsplats)) {
        HookEngineF(oCGame__Render, 7, _Bloodsplats_Loop);
        _LeGo_Flags = _LeGo_Flags | LeGo_Bloodsplats;
    };
};
