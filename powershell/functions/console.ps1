


# Console
function Console-Inline {
   param(
      [int]$Code,
      [string]$Label,
      [string]$Message
   )

   $Color = switch ($Code) {
      0 { "Blue" }
      1 { "Red" }
      2 { "Yellow" }
      3 { "Magenta" }
      4 { "Green" }
      default { "Gray" }
   }

   Write-Host ""
   Write-Host "[ " -NoNewline
   Write-Host "$Label" -NoNewline -ForegroundColor $Color
   Write-Host " ] › $Message"
   Write-Host ""
}


# Console
function Console {
   param(
      [int]$Code,
      [string]$Message
   )

   $Color = ""
   $Label = ""
   switch ($Code) {
      0 { 
         $Color = "Blue"
         $Label = "INFO"
      }
      1 { 
         $Color = "Red"
         $Label = "ERROR"
      }
      2 { 
         $Color = "Yellow"
         $Label = "WARNING"
      }
      3 { 
         $Color = "Magenta"
         $Label = "EXECUTION"
      }
      4 { 
         $Color = "Green"
         $Label = "SUCCESS"
      }
      default { 
         $Color = "Gray"
         $Label = "?"
      }
   }

   Write-Host ""
   Write-Host "[ " -NoNewline
   Write-Host "$Label" -NoNewline -ForegroundColor $Color
   Write-Host " ] › $Message"
   Write-Host ""
}

# Console
function Console-Line {
   param(
      [int]$Code,
      [string]$Message
   )

   $Color = ""
   $Label = ""
   $Count = 0
   switch ($Code) {
      0 { 
         $Color = "Blue"
         $Label = "INFO"
         $Count = 10
      }
      1 { 
         $Color = "Red"
         $Label = "ERROR"
         $Count = 11
      }
      2 { 
         $Color = "Yellow"
         $Label = "WARNING"
         $Count = 13
      }
      3 { 
         $Color = "Magenta"
         $Label = "EXECUTION"
      }
      4 { 
         $Color = "Green"
         $Label = "SUCCESS"
      }
      default { 
         $Color = "Gray"
         $Label = "?"
         $Count = 1
      }
   }

   Write-Host ""
   Write-Host "  ------------------------------ ‹ " -NoNewline
   Write-Host "$Label" -NoNewline -ForegroundColor $Color
   Write-Host " › ------------------------------"
   Write-Host "  »  $Message"
   Write-Host " " ("-" * ($Count+60) )
   Write-Host ""
}
