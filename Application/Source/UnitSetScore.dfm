object fSetScore: TfSetScore
  Left = 0
  Top = 0
  BiDiMode = bdRightToLeft
  ClientHeight = 503
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object gbAll: TAdvGroupBox
    Left = 0
    Top = 0
    Width = 802
    Height = 503
    Align = alClient
    Enabled = False
    TabOrder = 1
    object P_SetScore: TAdvPanel
      Left = 2
      Top = 3
      Width = 798
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      Color = 16445929
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UseDockManager = True
      Version = '1.9.0.5'
      BorderColor = 16765615
      Caption.Color = 16773091
      Caption.ColorTo = 16765615
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clBlack
      Caption.Font.Height = -11
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.GradientDirection = gdVertical
      Caption.Indent = 2
      Caption.ShadeLight = 255
      CollapsColor = clNone
      CollapsDelay = 0
      ColorTo = 15587527
      ColorMirror = 15587527
      ColorMirrorTo = 16773863
      ShadowColor = clBlack
      ShadowOffset = 0
      StatusBar.BorderColor = 16765615
      StatusBar.BorderStyle = bsSingle
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = 7485192
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Color = 16245715
      StatusBar.ColorTo = 16109747
      StatusBar.GradientDirection = gdVertical
      Styler = ps
      DesignSize = (
        798
        28)
      FullHeight = 0
      object RG_TS: TAdvOfficeRadioGroup
        Left = 544
        Top = -4
        Width = 251
        Height = 41
        BorderStyle = bsNone
        Version = '1.2.4.1'
        Anchors = [akTop, akRight]
        BiDiMode = bdRightToLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        ParentFont = False
        TabOrder = 0
        OnClick = RG_TSClick
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #1705#1583' '#1591#1585#1575#1581
          #1705#1583' '#1588#1585#1705#1578' '#1705#1606#1606#1583#1607)
        Ellipsis = True
        ShowFocus = False
      end
    end
    object P_Position: TAdvPanel
      Left = 2
      Top = 31
      Width = 798
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      Color = 16445929
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      UseDockManager = True
      Version = '1.9.0.5'
      BorderColor = 16765615
      Caption.Color = 16773091
      Caption.ColorTo = 16765615
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clBlack
      Caption.Font.Height = -11
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.GradientDirection = gdVertical
      Caption.Indent = 2
      Caption.ShadeLight = 255
      CollapsColor = clNone
      CollapsDelay = 0
      ColorTo = 15587527
      ColorMirror = 15587527
      ColorMirrorTo = 16773863
      ShadowColor = clBlack
      ShadowOffset = 0
      StatusBar.BorderColor = 16765615
      StatusBar.BorderStyle = bsSingle
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = 7485192
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Color = 16245715
      StatusBar.ColorTo = 16109747
      StatusBar.GradientDirection = gdVertical
      Styler = ps
      DesignSize = (
        798
        33)
      FullHeight = 0
      object Label3: TLabel
        Left = 730
        Top = 10
        Width = 57
        Height = 13
        Anchors = [akTop, akRight]
        BiDiMode = bdRightToLeft
        Caption = #1705#1583' '#1605#1587#1575#1576#1602#1607' :'
        ParentBiDiMode = False
        Transparent = True
      end
      object Label4: TLabel
        Left = 624
        Top = 10
        Width = 41
        Height = 13
        Anchors = [akTop, akRight]
        BiDiMode = bdRightToLeft
        Caption = #1608#1590#1593#1610#1578' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        Transparent = True
      end
      object L_Position: TLabel
        Left = 614
        Top = 10
        Width = 4
        Height = 13
        Anchors = [akLeft, akTop, akRight]
        BiDiMode = bdRightToLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        Transparent = True
      end
      object BitBtn4: TAdvGlowButton
        Left = 7
        Top = 3
        Width = 178
        Height = 26
        Caption = #1583#1575#1583#1606' '#1575#1605#1578#1610#1575#1586' '#1605#1580#1583#1583' '#1576#1607' '#1605#1587#1575#1576#1602#1607
        ImageIndex = 9
        Images = fMain.ilButton
        DisabledImages = fMain.ilButtonOff
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 0
        OnClick = BitBtn4Click
        Appearance.BorderColor = 14727579
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorDown = 4548219
        Appearance.BorderColorChecked = 4548219
        Appearance.Color = 15653832
        Appearance.ColorTo = 16178633
        Appearance.ColorChecked = 11918331
        Appearance.ColorCheckedTo = 7915518
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7778289
        Appearance.ColorDownTo = 4296947
        Appearance.ColorHot = 15465983
        Appearance.ColorHotTo = 11332863
        Appearance.ColorMirror = 15586496
        Appearance.ColorMirrorTo = 16245200
        Appearance.ColorMirrorHot = 5888767
        Appearance.ColorMirrorHotTo = 10807807
        Appearance.ColorMirrorDown = 946929
        Appearance.ColorMirrorDownTo = 5021693
        Appearance.ColorMirrorChecked = 10480637
        Appearance.ColorMirrorCheckedTo = 5682430
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        Enabled = False
      end
      object ME_Position: TMaskEdit
        Left = 680
        Top = 7
        Width = 47
        Height = 21
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Ctl3D = True
        EditMask = '000\-000;1;_'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        MaxLength = 7
        ParentBiDiMode = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        Text = '   -   '
        OnChange = ME_PositionChange
        OnKeyDown = ME_PositionKeyDown
      end
    end
    object gSetScore: TAdvColumnGrid
      Left = 2
      Top = 64
      Width = 798
      Height = 386
      Cursor = crDefault
      Align = alClient
      BiDiMode = bdLeftToRight
      ColCount = 7
      Ctl3D = True
      DefaultRowHeight = 21
      FixedCols = 0
      RowCount = 2
      Font.Charset = ARABIC_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing]
      ParentBiDiMode = False
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssBoth
      ShowHint = False
      TabOrder = 2
      OnKeyDown = gSetScoreKeyDown
      ActiveRowColor = 15790320
      GridLineColor = 15855083
      GridFixedLineColor = 13745060
      OnGetCellColor = gSetScoreGetCellColor
      OnRightClickCell = gSetScoreRightClickCell
      OnEditingDone = gSetScoreEditingDone
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ActiveCellColor = 10344697
      ActiveCellColorTo = 6210033
      ColumnHeaders.Strings = (
        ''
        #1575#1605#1578#1610#1575#1586
        #1581#1583#1575#1705#1579#1585' '#1575#1605#1578#1610#1575#1586
        #1593#1606#1608#1575#1606' '#1605#1587#1575#1576#1602#1607
        #1705#1583' '#1605#1587#1575#1576#1602#1607
        #1606#1575#1605' '#1582#1575#1606#1608#1575#1583#1711#1610
        #1705#1583)
      ColumnSize.Stretch = True
      ColumnSize.StretchColumn = 3
      ControlLook.FixedGradientFrom = 16513526
      ControlLook.FixedGradientTo = 15260626
      ControlLook.FixedGradientHoverFrom = 15000287
      ControlLook.FixedGradientHoverTo = 14406605
      ControlLook.FixedGradientHoverMirrorFrom = 14406605
      ControlLook.FixedGradientHoverMirrorTo = 13813180
      ControlLook.FixedGradientHoverBorder = 12033927
      ControlLook.FixedGradientDownFrom = 14991773
      ControlLook.FixedGradientDownTo = 14991773
      ControlLook.FixedGradientDownMirrorFrom = 14991773
      ControlLook.FixedGradientDownMirrorTo = 14991773
      ControlLook.FixedGradientDownBorder = 14991773
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'Tahoma'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'Tahoma'
      FilterDropDown.Font.Style = []
      FilterDropDown.Height = 200
      FilterDropDown.Width = 200
      FilterDropDownClear = '(All)'
      FixedColWidth = 0
      FixedFont.Charset = ARABIC_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -12
      FixedFont.Name = 'B Nazanin'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      Grouping.HeaderColor = clInactiveCaptionText
      Grouping.HeaderColorTo = clWhite
      Grouping.SummaryColor = 15790320
      Grouping.SummaryColorTo = clWhite
      Look = glOffice2007
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'Tahoma'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'Tahoma'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'Tahoma'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'Tahoma'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      ScrollType = ssEncarta
      ScrollWidth = 16
      SearchFooter.Color = 16513526
      SearchFooter.ColorTo = clNone
      SearchFooter.FindNextCaption = #1576#1593#1583#1610
      SearchFooter.FindPrevCaption = #1602#1576#1604#1610
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SearchFooter.ShowHighLight = False
      SearchFooter.ShowMatchCase = False
      SelectionColor = 6210033
      SelectionColorTo = 15387318
      ShowDesignHelper = False
      SortSettings.Column = 4
      SortSettings.Show = True
      SortSettings.UpGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000010000008000000080
        0000008000000080000000800000008000000080000000800000008000000080
        00000080000002800000097F0000197D0000387900005876000075720000936E
        0000AC6B0000BF690000C7680000C9680000C9680000C9680000C9680000C968
        0000C9680000C9670000C9670000C9670000C9670000C9670000C9670000C967
        0000C9670000C9670000C9670000C9670000C9670000C9670000C9670000C967
        0000C9670000C9670000C9670000C9670000C8670000C6660100C4650100BF64
        0300B7610600AB5D0A009C580F008650180065462400513F2D00403A34003939
        39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
        4100424242004343430044444400454545004646460047474700484848004949
        49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
        5100525252005353530054545400555555005656560057575700585858005959
        59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
        6100626262006363630064646400656565006666660067676700686868006969
        69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
        7100727272007373730074747400757575007676760077777700787878007979
        79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
        8100828282008383830084848400858585008686860087878700888888008989
        89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
        9100929292009393930094949400959595009696960097979700989898009999
        99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A5A5A500B6B5
        B400C6C4C200D6D3D000E7E3DF00F1EDE900F8F5F200FCF9F600FDFBF900FEFC
        FA00FEFCFA00FEFCFB00FEFCF900FEFBF700FEFAF600FEFAF500FEF9F300FEF8
        F100FEF7F000FEF7EF00FEF6EE00FEF6ED00FEF5EB00FEF4E900FEF3E700FEF2
        E600FEF2E500FEF1E300FEF1E100FEF0E000FEEFDF00FEEEDD00FEEEDB00FEED
        DA00FEECD800FEEBD600FEEAD400FEEAD300FEE9D100FEE8D000FEE8CF00FEE7
        CD00FEE6CB00FEE5CA00FEE4C900FEE4C700FEE3C600FEE3C500FEE2C300FEE1
        C100FEE0C000FEDFBE00FEDFBD00FEDEBC00FEDDBB00FEDCB900FEDCB700FEDB
        B500FEDAB400FEDAB300FED9B200FED9B100FED8B000FED7AE00FED7AC00FED6
        AB00FED5AA00FED5A800FED3A600FED2A400FED1A200FED0A000FECF9D00FECE
        9C00FECD9A00FECC9900FECC9900FEC89B00FEC09F00FEAEA800FE91B600FE69
        CA00FE49D900FE2DE700FE14F400FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA191919191919191919191919
        1919191919191919FAFAFA19CFD1D4D6D9DCDEE0E3E4E6E7E8EAECECEBEBEBEB
        19FAFA19CBCFD1D5D6D9DCDEE00A0A0A0A0A0A0A0A0AEBEB19FAFA19CACBCFD1
        D4D8D8DCDE0A0A0A0A0A0A0A0A0AEBEB19FAFA19C6C9CBCED1D2D6D8DBDEE2E3
        E4E6E7E8E9ECECEB19FAFA19C4C60A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0AECEC
        19FAFA19C1C30A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0AE8EA19FAFA19BFC1C3C6
        C9CBCED1D2D5D8DADEE0E3E4E5E7E8E819FAFA19BDBFC0C3C6C9CACED00A0A0A
        0A0A0A0A0A0AE7E819FAFA19BABDBEC0C3C6C8CACD0A0A0A0A0A0A0A0A0AE5E6
        19FAFA19B8BABDBFC1C3C6C8CACED0D1D6D8DADDE0E2E3E519FAFA19B5B70A0A
        0A0A0A0A0A0A0A0A0A0A0A0A0A0AE0E319FAFA19B3B50A0A0A0A0A0A0A0A0A0A
        0A0A0A0A0A0AE0E219FAFA19B1B3B5B7B8BDBEC0C3C5C8CACDD0D1D5D8DADDDF
        19FAFA19AFB1B2B5B7B9BBBEC00A0A0A0A0A0A0A0A0AD9DD19FAFA19ADADB0B1
        B4B7B8BBBD0A0A0A0A0A0A0A0A0AD8DA19FAFA19ABADADB0B2B5B7B8BDBDC0C2
        C4C6CACDCFD1D5D619FAFA19ABAB0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0AD1D5
        19FAFA19ABAB0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0ACFD119FAFA19ABABABAB
        ADADAFB1B3B6B8BBBDC0C2C4C6C9CBCF19FAFA19ABABABABABACADB0B1B3B7B8
        BBBDBFC2C4C6C9CB19FAFAFA1919191919191919191919191919191919191919
        FAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA}
      Version = '3.1.1.3'
      Columns = <
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taLeftJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          DropDownCount = 8
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HeaderAlignment = taLeftJustify
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 0
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = 16771029
          ColumnPopupType = cpFixedCellsRClick
          DropDownCount = 8
          EditLength = 0
          Editor = edSpinEdit
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'B Nazanin'
          Font.Style = [fsBold]
          Header = #1575#1605#1578#1610#1575#1586
          HeaderAlignment = taCenter
          HeaderFont.Charset = ARABIC_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'B Nazanin'
          HeaderFont.Style = [fsBold]
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = False
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 50
          Tag = 0
          Width = 70
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          DropDownCount = 8
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'B Nazanin'
          Font.Style = [fsBold]
          Header = #1581#1583#1575#1705#1579#1585' '#1575#1605#1578#1610#1575#1586
          HeaderAlignment = taCenter
          HeaderFont.Charset = ARABIC_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'B Nazanin'
          HeaderFont.Style = [fsBold]
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = True
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 70
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          DropDownCount = 8
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'B Nazanin'
          Font.Style = [fsBold]
          Header = #1593#1606#1608#1575#1606' '#1605#1587#1575#1576#1602#1607
          HeaderAlignment = taRightJustify
          HeaderFont.Charset = ARABIC_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'B Nazanin'
          HeaderFont.Style = [fsBold]
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          ReadOnly = True
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 423
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          DropDownCount = 8
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'B Nazanin'
          Font.Style = [fsBold]
          Header = #1705#1583' '#1605#1587#1575#1576#1602#1607
          HeaderAlignment = taCenter
          HeaderFont.Charset = ARABIC_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'B Nazanin'
          HeaderFont.Style = [fsBold]
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = ARABIC_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = [fsBold]
          ReadOnly = True
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 90
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          DropDownCount = 8
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'B Nazanin'
          Font.Style = [fsBold]
          Header = #1606#1575#1605' '#1582#1575#1606#1608#1575#1583#1711#1610
          HeaderAlignment = taCenter
          HeaderFont.Charset = ARABIC_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'B Nazanin'
          HeaderFont.Style = [fsBold]
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = ARABIC_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = [fsBold]
          ReadOnly = True
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 90
        end
        item
          AutoMinSize = 0
          AutoMaxSize = 0
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          ColumnPopupType = cpFixedCellsRClick
          DropDownCount = 8
          EditLength = 0
          Editor = edNormal
          FilterCaseSensitive = False
          Fixed = False
          Font.Charset = ARABIC_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'B Nazanin'
          Font.Style = [fsBold]
          Header = #1705#1583
          HeaderAlignment = taCenter
          HeaderFont.Charset = ARABIC_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'B Nazanin'
          HeaderFont.Style = [fsBold]
          MinSize = 0
          MaxSize = 0
          Password = False
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintColor = clWhite
          PrintFont.Charset = ARABIC_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = [fsBold]
          ReadOnly = True
          ShowBands = False
          SortStyle = ssAutomatic
          SpinMax = 0
          SpinMin = 0
          SpinStep = 1
          Tag = 0
          Width = 50
        end>
      ExplicitLeft = -326
      ExplicitTop = 208
      ColWidths = (
        0
        70
        70
        423
        90
        90
        50)
    end
    object pHint: TAdvPanel
      Left = 2
      Top = 450
      Width = 798
      Height = 18
      Align = alBottom
      BevelOuter = bvNone
      Color = 16445929
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      UseDockManager = True
      Version = '1.9.0.5'
      BorderColor = 16765615
      Caption.Color = 16773091
      Caption.ColorTo = 16765615
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clBlack
      Caption.Font.Height = -11
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.GradientDirection = gdVertical
      Caption.Indent = 2
      Caption.ShadeLight = 255
      CollapsColor = clNone
      CollapsDelay = 0
      ColorTo = 15587527
      ColorMirror = 15587527
      ColorMirrorTo = 16773863
      ShadowColor = clBlack
      ShadowOffset = 0
      StatusBar.BorderColor = 16765615
      StatusBar.BorderStyle = bsSingle
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = 7485192
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Color = 16245715
      StatusBar.ColorTo = 16109747
      StatusBar.GradientDirection = gdVertical
      Styler = ps
      DesignSize = (
        798
        18)
      FullHeight = 18
      object Label1: TLabel
        Left = 398
        Top = 2
        Width = 389
        Height = 13
        Anchors = [akTop, akRight]
        BiDiMode = bdRightToLeft
        Caption = 
          #1576#1585#1575#1610' '#1578#1605#1575#1605' '#1605#1587#1575#1576#1602#1575#1578#1610' '#1705#1607' '#1587#1578#1608#1606' '#1575#1605#1578#1610#1575#1586' '#1570#1606#1607#1575' '#1582#1575#1604#1610' '#1606#1610#1587#1578#1548' '#1575#1605#1578#1610#1575#1586' '#1583#1575#1583#1607' '#1588#1583 +
          #1607' '#1579#1576#1578' '#1605#1610' '#1711#1585#1583#1583'. '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        Transparent = True
      end
    end
    object AdvPanel2: TAdvPanel
      Left = 2
      Top = 468
      Width = 798
      Height = 33
      Align = alBottom
      BevelOuter = bvNone
      Color = 16445929
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      TabStop = True
      UseDockManager = True
      Version = '1.9.0.5'
      BorderColor = 16765615
      Caption.Color = 16773091
      Caption.ColorTo = 16765615
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clBlack
      Caption.Font.Height = -11
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.GradientDirection = gdVertical
      Caption.Indent = 2
      Caption.ShadeLight = 255
      CollapsColor = clNone
      CollapsDelay = 0
      ColorTo = 15587527
      ColorMirror = 15587527
      ColorMirrorTo = 16773863
      ShadowColor = clBlack
      ShadowOffset = 0
      StatusBar.BorderColor = 16765615
      StatusBar.BorderStyle = bsSingle
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = 7485192
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Color = 16245715
      StatusBar.ColorTo = 16109747
      StatusBar.GradientDirection = gdVertical
      Styler = ps
      DesignSize = (
        798
        33)
      FullHeight = 0
      object BitBtn3: TAdvGlowButton
        Left = 7
        Top = 4
        Width = 100
        Height = 26
        Caption = #1578#1575#1610#1610#1583
        ImageIndex = 0
        Images = fMain.ilButton
        DisabledImages = fMain.ilButtonOff
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 0
        OnClick = BitBtn3Click
        Appearance.BorderColor = 14727579
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorDown = 4548219
        Appearance.BorderColorChecked = 4548219
        Appearance.Color = 15653832
        Appearance.ColorTo = 16178633
        Appearance.ColorChecked = 11918331
        Appearance.ColorCheckedTo = 7915518
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7778289
        Appearance.ColorDownTo = 4296947
        Appearance.ColorHot = 15465983
        Appearance.ColorHotTo = 11332863
        Appearance.ColorMirror = 15586496
        Appearance.ColorMirrorTo = 16245200
        Appearance.ColorMirrorHot = 5888767
        Appearance.ColorMirrorHotTo = 10807807
        Appearance.ColorMirrorDown = 946929
        Appearance.ColorMirrorDownTo = 5021693
        Appearance.ColorMirrorChecked = 10480637
        Appearance.ColorMirrorCheckedTo = 5682430
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
      object AdvGlowButton2: TAdvGlowButton
        Left = 115
        Top = 4
        Width = 100
        Height = 26
        Caption = #1580#1587#1578#1580#1608
        ImageIndex = 4
        Images = fMain.ilButton
        DisabledImages = fMain.ilButtonOff
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 1
        OnClick = AdvGlowButton2Click
        Appearance.BorderColor = 14727579
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorDown = 4548219
        Appearance.BorderColorChecked = 4548219
        Appearance.Color = 15653832
        Appearance.ColorTo = 16178633
        Appearance.ColorChecked = 11918331
        Appearance.ColorCheckedTo = 7915518
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7778289
        Appearance.ColorDownTo = 4296947
        Appearance.ColorHot = 15465983
        Appearance.ColorHotTo = 11332863
        Appearance.ColorMirror = 15586496
        Appearance.ColorMirrorTo = 16245200
        Appearance.ColorMirrorHot = 5888767
        Appearance.ColorMirrorHotTo = 10807807
        Appearance.ColorMirrorDown = 946929
        Appearance.ColorMirrorDownTo = 5021693
        Appearance.ColorMirrorChecked = 10480637
        Appearance.ColorMirrorCheckedTo = 5682430
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
      object AdvGlowButton1: TAdvGlowButton
        Left = 607
        Top = 4
        Width = 188
        Height = 26
        Hint = #1705#1604#1610#1705' '#1585#1575#1587#1578
        Anchors = [akTop, akRight]
        Caption = #1662#1575#1705' '#1705#1585#1583#1606' '#1575#1605#1578#1740#1575#1586' '#1583#1575#1583#1607' '#1588#1583#1607' '#1576#1607' '#1585#1583#1740#1601
        ImageIndex = 25
        Images = fMain.ilButton
        DisabledImages = fMain.ilButtonOff
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = AdvGlowButton1Click
        Appearance.BorderColor = 14727579
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorDown = 4548219
        Appearance.BorderColorChecked = 4548219
        Appearance.Color = 15653832
        Appearance.ColorTo = 16178633
        Appearance.ColorChecked = 11918331
        Appearance.ColorCheckedTo = 7915518
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 7778289
        Appearance.ColorDownTo = 4296947
        Appearance.ColorHot = 15465983
        Appearance.ColorHotTo = 11332863
        Appearance.ColorMirror = 15586496
        Appearance.ColorMirrorTo = 16245200
        Appearance.ColorMirrorHot = 5888767
        Appearance.ColorMirrorHotTo = 10807807
        Appearance.ColorMirrorDown = 946929
        Appearance.ColorMirrorDownTo = 5021693
        Appearance.ColorMirrorChecked = 10480637
        Appearance.ColorMirrorCheckedTo = 5682430
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
    end
  end
  object fs: TAdvFormStyler
    Style = tsOffice2007Luna
    AppStyle = fMain.apps
  end
  object ps: TAdvPanelStyler
    Tag = 0
    Settings.AnchorHint = False
    Settings.BevelInner = bvNone
    Settings.BevelOuter = bvNone
    Settings.BevelWidth = 1
    Settings.BorderColor = 16765615
    Settings.BorderShadow = False
    Settings.BorderStyle = bsNone
    Settings.BorderWidth = 0
    Settings.CanMove = False
    Settings.CanSize = False
    Settings.Caption.Color = 16773091
    Settings.Caption.ColorTo = 16765615
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = clBlack
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'Tahoma'
    Settings.Caption.Font.Style = []
    Settings.Caption.GradientDirection = gdVertical
    Settings.Caption.Indent = 2
    Settings.Caption.ShadeLight = 255
    Settings.Collaps = False
    Settings.CollapsColor = clNone
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = 16445929
    Settings.ColorTo = 15587527
    Settings.ColorMirror = 15587527
    Settings.ColorMirrorTo = 16773863
    Settings.Cursor = crDefault
    Settings.Font.Charset = DEFAULT_CHARSET
    Settings.Font.Color = 7485192
    Settings.Font.Height = -11
    Settings.Font.Name = 'Tahoma'
    Settings.Font.Style = []
    Settings.FixedTop = False
    Settings.FixedLeft = False
    Settings.FixedHeight = False
    Settings.FixedWidth = False
    Settings.Height = 120
    Settings.Hover = False
    Settings.HoverColor = clNone
    Settings.HoverFontColor = clNone
    Settings.Indent = 0
    Settings.ShadowColor = clBlack
    Settings.ShadowOffset = 0
    Settings.ShowHint = False
    Settings.ShowMoveCursor = False
    Settings.StatusBar.BorderColor = 16765615
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = 7485192
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = 16245715
    Settings.StatusBar.ColorTo = 16109747
    Settings.StatusBar.GradientDirection = gdVertical
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Style = psOffice2007Luna
    Left = 32
  end
end