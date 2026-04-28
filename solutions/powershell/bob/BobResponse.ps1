Function Get-BobResponse() {
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
    Param (
        [string]$HeyBob
    )
    
    $HeyBob = $HeyBob.Trim()

    $is_silence = $false
    $is_question = $false
    $is_yelling = $false
    $contains_letters = $false

    if ( $HeyBob -match '[A-Za-z]' )
    {
        $contains_letters = $true
    }

    if ( $HeyBob -eq "" )
    {
        $is_silence = $true
    }

    if ( ($HeyBob.EndsWith("?")) -and (-not ($HeyBob.StartsWith("?"))) )
    {
        $is_question = $true
    }

    if ( $contains_letters -and($HeyBob.ToUpper() -ceq $HeyBob) )
    {
        $is_yelling = $true
    }

    if ( $is_silence )
    {
        Return "Fine. Be that way!"
    }
    elseif ( $is_question -and $is_yelling )
    {
        Return "Calm down, I know what I'm doing!"
    }
    elseif ( $is_question )
    {
        Return "Sure."
    }
    elseif ( $is_yelling )
    {
        Return "Whoa, chill out!"
    }
    else
    {
        Return "Whatever."
    }
}
