/*
 * Initialization function called by Ninja after "Init_Global" (G2) / "Init_<Levelname>" (G1)
 */
func void Ninja_Bloodsplats_Init() {
    // Wrapper for "LeGo_Init" to ensure correct LeGo initialization without breaking the mod
    LeGo_MergeFlags(/* LeGo_Bloodsplats = */ LeGo_FrameFunctions | LeGo_Random | LeGo_Anim8);

    // Initialize LeGo_Bloodsplats explicitly
    FF_ApplyOnce(_Bloodsplats_Loop);
    _LeGo_Flags = _LeGo_Flags | LeGo_Bloodsplats;
};
