; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the "End Battle" tab under the "TH Snipe" tab under the "Search & Attack" tab under the "Attack Plan" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: CodeSlinger69 (2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

Global $g_hChkTSActivateCamps2 = 0, $g_hTxtTSArmyCamps2 = 0
Global $g_hGrpTSEndBattle = 0, $g_hLblTSArmyCamps2 = 0

Func CreateAttackSearchTHSnipeEndBattle()
    Local $x = 10, $y = 45
	$g_hGrpTSEndBattle = GUICtrlCreateGroup(GetTranslated(606,1, -1),  $x - 5, $y - 20, 420, 305)
	;Apply to switch Attack Standard after THSnipe End ==>
	  GUICtrlCreateLabel(GetTranslated(606,28,"Switch DB Attack at END") & ":",$x, $y , 143 , 18,$SS_LEFT)
	  $y += 15
		 ;chk camps
		 $g_hChkTSActivateCamps2 = GUICtrlCreateCheckbox("",$x+2,$y+3,16,16)
		 GUICtrlSetOnEvent(-1, "chkTSActivateCamps2")

		 ;Army camps %
		 $g_hLblTSArmyCamps2 = GUICtrlCreateLabel("Camps >=", $x +20 , $y +4 , -1, -1)
		 GUICtrlSetState(-1,$GUI_DISABLE)
		 $g_hTxtTSArmyCamps2 = GUICtrlCreateInput("50", $x + 75, $y, 35, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		 GUICtrlSetState(-1,$GUI_DISABLE)
		 _GUICtrlSetTip(-1, GetTranslated(606,29, "Set the % Army camps before activate this option"))
		 GUICtrlSetLimit(-1, 6)

		 ;camps %
		 GUICtrlCreateLabel("%", $x+115 , $y +4 , -1, -1)
		 GUICtrlSetState(-1,$GUI_DISABLE)
	  $y +=26

	;==> Apply to switch Attack Standard after THSnipe End

#CS
	 		$chkTSTimeStopAtk = GUICtrlCreateCheckbox(GetTranslated(606,2, -1) ,$x, $y, -1, -1)
			$txtTip = GetTranslated(606,3, -1) & @CRLF & GetTranslated(606,4, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkTSTimeStopAtk")
			GUICtrlSetState(-1, $GUI_CHECKED)
    $y +=20
		$lblTSTimeStopAtka = GUICtrlCreateLabel(GetTranslated(606,5,-1)& ":", $x + 16, $y + 3, -1, -1)
		$txtTSTimeStopAtk = GUICtrlCreateInput("20", $x + 85, $y + 1, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
		$lblTSTimeStopAtk = GUICtrlCreateLabel(GetTranslated(603,6, -1), $x + 120, $y + 3, -1, -1)
   $y += 20
		$chkTSTimeStopAtk2 = GUICtrlCreateCheckbox(GetTranslated(606,2, -1) ,$x, $y, -1, -1)
			$txtTip = GetTranslated(606,3, -1) & @CRLF & GetTranslated(606,4, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkTSTimeStopAtk2")
			GUICtrlSetState(-1, $GUI_UNCHECKED)
   $y += 20
		$lblTSTimeStopAtk2a = GUICtrlCreateLabel(GetTranslated(606,5, -1)& ":", $x + 16, $y + 3, -1, -1)
		$txtTSTimeStopAtk2 = GUICtrlCreateInput("5", $x + 85, $y + 1, 30, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblTSTimeStopAtk2 = GUICtrlCreateLabel(GetTranslated(603,6, -1), $x + 120, $y + 3, -1, -1)
	$y += 21
		$lblTSMinRerourcesAtk2 = GUICtrlCreateLabel(GetTranslated(606,7, -1) & ":", $x + 16 , $y + 2, -1, -1)
			$txtTip = GetTranslated(606,8, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
	$y += 21
		$txtTSMinGoldStopAtk2 = GUICtrlCreateInput("2000", $x + 65, $y , 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picTSMinGoldStopAtk2 = GUICtrlCreateIcon($g_sLibIconPath, $eIcnGold, $x + 117, $y, 16, 16)
			_GUICtrlSetTip(-1, $txtTip)
   $y += 21
		$txtTSMinElixirStopAtk2 = GUICtrlCreateInput("2000", $x + 65, $y , 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picTSMinElixirStopAtk2 = GUICtrlCreateIcon($g_sLibIconPath, $eIcnElixir, $x + 117, $y, 16, 16)
			_GUICtrlSetTip(-1, $txtTip)
   $y += 21
		$txtTSMinDarkElixirStopAtk2 = GUICtrlCreateInput("50", $x + 65, $y , 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$picTSMinDarkElixirStopAtk2 = GUICtrlCreateIcon($g_sLibIconPath, $eIcnDark, $x + 117, $y, 16, 16)
			_GUICtrlSetTip(-1, $txtTip)
	$y += 21
		$chkTSEndNoResources = GUICtrlCreateCheckbox(GetTranslated(606,9, -1), $x , $y , -1, -1)
			$txtTip = GetTranslated(606,10, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_ENABLE)
	$y += 21
		$chkTSEndOneStar = GUICtrlCreateCheckbox(GetTranslated(606,11, -1) , $x, $y , -1, -1)
			$txtTip = GetTranslated(606,12, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_ENABLE)
	$y += 21
		$chkTSEndTwoStars = GUICtrlCreateCheckbox(GetTranslated(606,13, -1) , $x, $y, -1, -1)
			$txtTip = GetTranslated(606,14, -1)
			_GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_ENABLE)
 #CE

	GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc
