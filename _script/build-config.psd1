@{
    "1.43" = @{
        DeployFiles = @("Domino143.7z")
        ResourceVersionPrefix = "1,43"
        DisplayName = "1.43"
        ArtifactName = "Domino143"
        CopyCmd = @("copy-base")
    }
    "1.44" = @{
        DeployFiles = @("Domino144.7z")
        ResourceVersionPrefix = "1,44"
        DisplayName = "1.44"
        ArtifactName = "Domino144"
        CopyCmd = @("copy-base", "copy-1.44")
    }
    "1.45_x86" = @{
        DeployFiles = @("Domino145_dev009_x86.7z")
        ResourceVersionPrefix = "1,45"
        DisplayName = "1.45 dev009 (32-bit)"
        ArtifactName = "Domino145_dev009_x86"
        CopyCmd = @("copy-base", "copy-1.45")
    }
    "1.45_x64" = @{
        DeployFiles = @("Domino145_dev009_x64.7z")
        ResourceVersionPrefix = "1,45"
        DisplayName = "1.45 dev009 (64-bit)"
        ArtifactName = "Domino145_dev009_x64"
        CopyCmd = @("copy-base", "copy-1.45")
    }
}
