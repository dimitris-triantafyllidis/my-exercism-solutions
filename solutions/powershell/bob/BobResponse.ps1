function Get-BobResponse() {
    <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.

    .PARAMETER HeyBob
    The sentence you say to Bob.

    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
    [CmdletBinding()]
    param (
        [string]$HeyBob
    )

    $HeyBob = $HeyBob.Trim()

    $IsSilence       = $HeyBob -eq $null
    $IsQuestion      = $HeyBob.EndsWith("?") -and (-not ($HeyBob.StartsWith("?")))
    $ContainsLetters = $HeyBob -match '[A-Za-z]'
    $IsYelling       = $ContainsLetters -and($HeyBob.ToUpper() -ceq $HeyBob)

    if     ( $IsSilence                  ) { return "Fine. Be that way!"                }
    elseif ( $IsQuestion -and $IsYelling ) { return "Calm down, I know what I'm doing!" }
    elseif ( $IsQuestion                 ) { return "Sure."                             }
    elseif ( $IsYelling                  ) { return "Whoa, chill out!"                  }
    else                                   { return "Whatever."                         }
}
