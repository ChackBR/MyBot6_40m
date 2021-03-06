; #FUNCTION# ====================================================================================================================
; Name ..........:
; Description ...: This function will update the statistics in the GUI.
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Boju (11-2016)
; Modified ......: CodeSlinger69 (2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......:
; ===============================================================================================================================
#include-once

Global $TempGainCost[3] = [0, 0, 0]

Func StartGainCost()
	$TempGainCost[0] = 0
	$TempGainCost[1] = 0
	$TempGainCost[2] = 0
	VillageReport(True, True)
	Local $tempCounter = 0
	While ($iGoldCurrent = "" Or $iElixirCurrent = "" Or ($iDarkCurrent = "" And $g_iStatsStartedWith[$CurrentAccount][$eLootDarkElixir] <> "")) And $tempCounter < 5
		$tempCounter += 1
		If _Sleep(100) Then Return
		VillageReport(True, True)
	WEnd
	$TempGainCost[0] = $iGoldCurrent ;$tempGold
	$TempGainCost[1] = $iElixirCurrent ;$tempElixir
	$TempGainCost[2] = $iDarkCurrent ;$tempDElixir
EndFunc   ;==>StartGainCost

Func EndGainCost($Type)
	VillageReport(True, True)
	Local $tempCounter = 0
	While ($iGoldCurrent = "" Or $iElixirCurrent = "" Or ($iDarkCurrent = "" And $g_iStatsStartedWith[$CurrentAccount][$eLootDarkElixir] <> "")) And $tempCounter < 5
		$tempCounter += 1
		VillageReport(True, True)
	WEnd

	Switch $Type
		Case "Collect"
			Local $tempGoldCollected = 0
			Local $tempElixirCollected = 0
			Local $tempDElixirCollected = 0

			If $TempGainCost[0] <> "" And $iGoldCurrent <> "" And $TempGainCost[0] <> $iGoldCurrent Then
				$tempGoldCollected = $iGoldCurrent - $TempGainCost[0]
				$g_iGoldFromMines[$CurrentAccount] += $tempGoldCollected
				$g_iStatsTotalGain[$CurrentAccount][$eLootGold] += $tempGoldCollected
			EndIf

			If $TempGainCost[1] <> "" And $iElixirCurrent <> "" And $TempGainCost[1] <> $iElixirCurrent Then
				$tempElixirCollected = $iElixirCurrent - $TempGainCost[1]
				$g_iElixirFromCollectors[$CurrentAccount] += $tempElixirCollected
				$g_iStatsTotalGain[$CurrentAccount][$eLootElixir] += $tempElixirCollected
			EndIf

			If $TempGainCost[2] <> "" And $iDarkCurrent <> "" And $TempGainCost[2] <> $iDarkCurrent Then
				$tempDElixirCollected = $iDarkCurrent - $TempGainCost[2]
				$g_iDElixirFromDrills[$CurrentAccount] += $tempDElixirCollected
				$g_iStatsTotalGain[$CurrentAccount][$eLootDarkElixir] += $tempDElixirCollected
			EndIf
		Case "Train"
			Local $tempElixirSpent = 0
			Local $tempDElixirSpent = 0
			If $TempGainCost[1] <> "" And $iElixirCurrent <> ""  And $TempGainCost[1] <> $iElixirCurrent Then
				$tempElixirSpent = ($TempGainCost[1] - $iElixirCurrent)
				$g_iTrainCostElixir[$CurrentAccount] += $tempElixirSpent
				$g_iStatsTotalGain[$CurrentAccount][$eLootElixir] -= $tempElixirSpent
			EndIf

			If $TempGainCost[2] <> "" And $iDarkCurrent <> ""  And $TempGainCost[2] <> $iDarkCurrent Then
				$tempDElixirSpent = ($TempGainCost[2] - $iDarkCurrent)
				$g_iTrainCostDElixir[$CurrentAccount] += $tempDElixirSpent
				$g_iStatsTotalGain[$CurrentAccount][$eLootDarkElixir] -= $tempDElixirSpent
			EndIf
	EndSwitch

	UpdateStats()
EndFunc   ;==>StartGainCost