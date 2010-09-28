object fResource: TfResource
  Left = 0
  Top = 0
  BiDiMode = bdRightToLeft
  ClientHeight = 438
  ClientWidth = 759
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
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 405
    Align = alClient
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
    FullHeight = 0
    object AdvGroupBox3: TAdvGroupBox
      Left = 0
      Top = 0
      Width = 759
      Height = 405
      Align = alClient
      TabOrder = 0
      object gAuthor: TAdvGroupBox
        Left = 2
        Top = 80
        Width = 755
        Height = 53
        BorderStyle = bsNone
        Align = alTop
        TabOrder = 1
        DesignSize = (
          755
          53)
        object Label8: TLabel
          Left = 696
          Top = 9
          Width = 51
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1662#1583#1610#1583' '#1570#1608#1585#1606#1583#1607':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label11: TLabel
          Left = 699
          Top = 34
          Width = 48
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1605#1585#1705#1586' '#1606#1588#1585':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object cbAuthor: TComboBox
          Left = 500
          Top = 5
          Width = 194
          Height = 21
          Style = csSimple
          Anchors = [akTop, akRight]
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          TextHint = #1605#1575#1606#1606#1583': '#1605#1591#1607#1585#1740#1548' '#1605#1585#1578#1590#1740
        end
        object cbPublication: TComboBox
          Left = 500
          Top = 30
          Width = 194
          Height = 21
          Style = csSimple
          Anchors = [akTop, akRight]
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          TextHint = #1605#1575#1606#1606#1583': '#1587#1608#1585#1607' '#1605#1607#1585
        end
      end
      object gFile: TAdvGroupBox
        Left = 2
        Top = 133
        Width = 755
        Height = 28
        BorderStyle = bsNone
        Align = alTop
        TabOrder = 2
        DesignSize = (
          755
          28)
        object Label4: TLabel
          Left = 724
          Top = 8
          Width = 23
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1601#1575#1740#1604':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object eFile: TButtonedEdit
          Left = 7
          Top = 4
          Width = 687
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          BiDiMode = bdLeftToRight
          Ctl3D = True
          Images = fMain.ilEditButton
          ParentBiDiMode = False
          ParentCtl3D = False
          RightButton.ImageIndex = 1
          RightButton.Visible = True
          TabOrder = 0
          OnRightButtonClick = eFileRightButtonClick
        end
      end
      object gWebPage: TAdvGroupBox
        Left = 2
        Top = 161
        Width = 755
        Height = 242
        BorderStyle = bsNone
        Align = alClient
        TabOrder = 3
        DesignSize = (
          755
          242)
        object Label2: TLabel
          Left = 722
          Top = 7
          Width = 25
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1662#1740#1608#1606#1583':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object eLink: TEdit
          Left = 7
          Top = 3
          Width = 687
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          BiDiMode = bdLeftToRight
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentBiDiMode = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object mContent: TMemo
          AlignWithMargins = True
          Left = 7
          Top = 30
          Width = 740
          Height = 208
          Margins.Left = 5
          Margins.Right = 5
          Anchors = [akLeft, akTop, akRight, akBottom]
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object gProperties: TAdvGroupBox
        Left = 2
        Top = 3
        Width = 755
        Height = 77
        BorderStyle = bsNone
        Align = alTop
        TabOrder = 0
        ExplicitTop = 2
        DesignSize = (
          755
          77)
        object Label6: TLabel
          Left = 728
          Top = 11
          Width = 19
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1606#1608#1593':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label1: TLabel
          Left = 717
          Top = 34
          Width = 30
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1593#1606#1608#1575#1606':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 700
          Top = 59
          Width = 47
          Height = 13
          Anchors = [akTop, akRight]
          Caption = #1585#1583#1607' '#1587#1606#1740':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7485192
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object cbKind: TComboBox
          Left = 624
          Top = 7
          Width = 70
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = cbKindChange
        end
        object eTitle: TEdit
          Left = 7
          Top = 31
          Width = 687
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object cbAgeClass: TComboBox
          Left = 500
          Top = 55
          Width = 194
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Library'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object clTags: TCheckListEdit
          Left = 115
          Top = 4
          Width = 62
          Height = 21
          AutoDropWidthSize = False
          EditorEnabled = False
          TabOrder = 3
          Visible = False
          DropWidth = 121
          DropHeight = 50
          DropColumns = 2
          DropFont.Charset = DEFAULT_CHARSET
          DropFont.Color = clWindowText
          DropFont.Height = -11
          DropFont.Name = 'Tahoma'
          DropFont.Style = []
          DropSorted = True
          TextDelimiter = ','
          TextEndChar = ']'
          TextStartChar = '['
          Version = '1.3.6.0'
        end
      end
    end
  end
  object AdvPanel2: TAdvPanel
    Left = 0
    Top = 405
    Width = 759
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
    TabOrder = 1
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
    FullHeight = 0
    object bApply: TAdvGlowButton
      Left = 9
      Top = 3
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
      Transparent = True
      TabOrder = 0
      TabStop = True
      OnClick = bApplyClick
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
      Layout = blGlyphRight
    end
  end
  object fs: TAdvFormStyler
    Style = tsOffice2007Luna
    AppStyle = fMain.apps
    Left = 8
    Top = 8
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
    Left = 40
    Top = 8
  end
  object odMultiMeida: TOpenDialog
    Filter = 'MultiMediaFile|*.*'
    Left = 10
    Top = 56
  end
end
