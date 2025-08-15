# vsc-ext-list.ps1 - A way to get a list of all of the installed VSCode-insiders extensions
#                    in a nice, formatted markdown list.

param(
  [string]$Output = "vscode-insiders-extensions.md"
)

# Function to get the list of installed extensions for VS Code Insiders
function Get-VscodeInsidersExtensions {
  # Get the path to the extensions directory for VS Code Insiders
  $extensionsPath = "$env:USERPROFILE\.vscode-insiders\extensions"
  if (-not (Test-Path -Path $extensionsPath)) {
    Write-Error "VS Code Insiders extensions directory not found at $extensionsPath"
    return $null
  }

  # Define a regular expression to match the format of a GUID.
  # This pattern will match a 32-character hexadecimal string with hyphens,
  # often preceded by a period.
  $guidPattern = '^\.[0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}$'

  # Get a list of all directories in the extensions folder
  # Filter out directories that match the GUID-like pattern
  $extensions = Get-ChildItem -Path $extensionsPath -Directory | Where-Object { -not ($_.Name -match $guidPattern) }

  # Create a list to hold the formatted extension data
  $extensionList = @()

  foreach ($extension in $extensions) {
    # The directory name is typically "publisher.extension-name" or "publisher.extension-name-version"
    $parts = $extension.Name.Split('-')

    # Check if the last part is a version number (e.g., "1.2.3")
    # If it is, the ID is everything before the version
    # If not, the whole directory name is the ID
    if ($parts[-1] -match '^\d+\.\d+\.\d+$') {
      # This is a version, so the ID is the parts before it
      $idParts = $parts[0..($parts.Count - 2)]
      $id = ($idParts -join '-')
    } else {
      # No version number, so the entire name is the ID
      $id = $extension.Name
    }

    # The marketplace link is constructed from the ID
    $marketplaceLink = "https://marketplace.visualstudio.com/items?itemName=$id"

    # Add a custom object to our list
    $extensionList += [pscustomobject]@{
      ID = $id
      MarketplaceLink = $marketplaceLink
    }
  }

  return $extensionList
}

# Get the list of extensions
$extensions = Get-VscodeInsidersExtensions

# If there are extensions, proceed to generate the markdown file
if ($null -ne $extensions) {
  # Ensure the output file has a .md extension
  $outputFile = $Output
  if ([System.IO.Path]::GetExtension($outputFile) -ne ".md") {
    $outputFile = "$outputFile.md"
  }

  # Generate the markdown content
  $markdownContent = @()
  $markdownContent += "# VS Code Insiders Extensions"
  $markdownContent += ""

  foreach ($ext in $extensions) {
    $markdownContent += "- [$($ext.ID)]($($ext.MarketplaceLink))"
  }

  # Write the content to the output file
  $markdownContent | Out-File -FilePath $outputFile -Encoding utf8
  Write-Host "Successfully generated markdown list of VS Code Insiders extensions to $outputFile"
}
