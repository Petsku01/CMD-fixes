Reset Power Plans (if Settings Don’t Apply):

    Command: powercfg -restoredefaultschemes
    Purpose: Resets power plans to default to clear corrupted settings.
    Steps:
        Run the command.
        Reapply 15-minute timeout:
            powercfg /change monitor-timeout-ac 15
            powercfg /change monitor-timeout-dc 15
