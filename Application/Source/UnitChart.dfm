object fChart: TfChart
  Left = 0
  Top = 0
  BiDiMode = bdRightToLeft
  ClientHeight = 532
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Library'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 416
    Top = 0
    Width = 374
    Height = 532
    Align = alRight
    BevelOuter = bvNone
    Color = 16445929
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -11
    Font.Name = 'Library'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '1.9.0.3'
    BorderColor = 16765615
    Caption.Color = 16773091
    Caption.ColorTo = 16765615
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'Library'
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
    StatusBar.Font.Name = 'Library'
    StatusBar.Font.Style = []
    StatusBar.Color = 16245715
    StatusBar.ColorTo = 16109747
    StatusBar.GradientDirection = gdVertical
    Styler = ps
    FullHeight = 15
    object AdvGroupBox4: TAdvGroupBox
      Left = 0
      Top = 250
      Width = 374
      Height = 102
      CaptionPosition = cpTopRight
      Align = alTop
      Caption = #1606#1605#1608#1583#1575#1585
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Library'
      Font.Style = []
      ParentCtl3D = True
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        374
        102)
      object lbl7: TLabel
        Left = 323
        Top = 49
        Width = 36
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1578#1608#1590#1610#1581' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExplicitLeft = 325
      end
      object lbl8: TLabel
        Left = 85
        Top = 49
        Width = 40
        Height = 13
        Caption = #1576#1610#1588#1610#1606#1607' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lbl2: TLabel
        Left = 326
        Top = 21
        Width = 33
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1593#1606#1608#1575#1606' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExplicitLeft = 328
      end
      object edtExtra: TEdit
        Left = 131
        Top = 45
        Width = 189
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
        TabOrder = 0
      end
      object seMax: TAdvSpinEdit
        Left = 16
        Top = 44
        Width = 65
        Height = 22
        Value = 0
        DateValue = 40372.521117534720000000
        HexValue = 0
        Color = clWhite
        Ctl3D = True
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        IncrementFloat = 0.100000000000000000
        IncrementFloatPage = 1.000000000000000000
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Library'
        LabelFont.Style = []
        MaxValue = 10000000
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        Visible = True
        Version = '1.4.5.0'
      end
      object chk2: TAdvOfficeCheckBox
        Left = 248
        Top = 67
        Width = 81
        Height = 20
        Anchors = [akTop, akRight]
        Checked = True
        TabOrder = 2
        OnClick = btnChartClick
        Alignment = taLeftJustify
        Caption = #1606#1605#1575#1610#1588' '#1605#1602#1583#1575#1585
        Ellipsis = True
        ReturnIsTab = False
        State = cbChecked
        Version = '1.2.4.0'
      end
      object edtTitle: TEdit
        Left = 16
        Top = 17
        Width = 304
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
        TabOrder = 3
      end
    end
    object AdvGroupBox2: TAdvGroupBox
      Left = 0
      Top = 81
      Width = 374
      Height = 57
      CaptionPosition = cpTopRight
      Align = alTop
      Caption = #1578#1575#1585#1610#1582
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Library'
      Font.Style = []
      ParentCtl3D = True
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        374
        57)
      object lbl5: TLabel
        Left = 321
        Top = 29
        Width = 38
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1575#1586' '#1578#1575#1585#1610#1582' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExplicitLeft = 329
      end
      object lbl6: TLabel
        Left = 212
        Top = 29
        Width = 37
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1578#1575' '#1578#1575#1585#1610#1582' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExplicitLeft = 220
      end
      object medtFH: TMaskEdit
        Left = 256
        Top = 26
        Width = 63
        Height = 21
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Ctl3D = True
        EditMask = '!0000/99/99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        MaxLength = 10
        ParentBiDiMode = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = '    /  /  '
      end
      object medtTH: TMaskEdit
        Left = 147
        Top = 26
        Width = 63
        Height = 21
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Ctl3D = True
        EditMask = '!0000/99/99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        MaxLength = 10
        ParentBiDiMode = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        Text = '    /  /  '
      end
      object cbbDate: TComboBox
        Left = 72
        Top = 25
        Width = 62
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 1
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Text = #1605#1575#1607#1575#1606#1607
        OnChange = btnChartClick
        Items.Strings = (
          #1585#1608#1586#1575#1606#1607
          #1605#1575#1607#1575#1606#1607
          #1587#1575#1604#1575#1606#1607)
      end
    end
    object AdvGroupBox5: TAdvGroupBox
      Left = 0
      Top = 194
      Width = 374
      Height = 56
      CaptionPosition = cpTopRight
      Align = alTop
      Caption = #1705#1610#1601#1610#1578
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Library'
      Font.Style = []
      ParentCtl3D = True
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        374
        56)
      object lbl10: TLabel
        Left = 334
        Top = 29
        Width = 25
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1606#1608#1593'  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExplicitLeft = 336
      end
      object cbbCS: TComboBox
        Left = 269
        Top = 25
        Width = 60
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = #1575#1605#1578#1610#1575#1586
        OnChange = btnChartClick
        Items.Strings = (
          #1575#1605#1578#1610#1575#1586
          #1578#1593#1583#1575#1583)
      end
    end
    object AdvGroupBox1: TAdvGroupBox
      Left = 0
      Top = 138
      Width = 374
      Height = 56
      CaptionPosition = cpTopRight
      Align = alTop
      Caption = #1575#1591#1604#1575#1593#1575#1578' '#1588#1582#1589#1740
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Library'
      Font.Style = []
      ParentCtl3D = True
      ParentFont = False
      TabOrder = 3
      DesignSize = (
        374
        56)
      object lbl3: TLabel
        Left = 315
        Top = 29
        Width = 44
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1580#1606#1587#1610#1578' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ParentFont = False
        Transparent = True
        ExplicitLeft = 363
      end
      object lbl4: TLabel
        Left = 194
        Top = 29
        Width = 50
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1585#1583#1607' '#1587#1606#1610' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 44
        Top = 29
        Width = 68
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1588#1585#1705#1578' '#1705#1606#1606#1583#1607' : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object cbbSex: TComboBox
        Left = 250
        Top = 25
        Width = 62
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Text = #1607#1605#1607
        OnChange = cbbSexChange
        Items.Strings = (
          #1607#1605#1607
          #1570#1602#1575#1610#1575#1606
          #1582#1575#1606#1605' '#1607#1575)
      end
      object cbbAge: TComboBox
        Left = 118
        Top = 25
        Width = 73
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        Text = #1607#1605#1607
        OnChange = cbbSexChange
        Items.Strings = (
          #1607#1605#1607
          #1606#1608#1606#1607#1575#1604#1575#1606
          #1576#1586#1585#1711#1587#1575#1604#1575#1606)
      end
      object ME_Code: TMaskEdit
        Left = 12
        Top = 25
        Width = 34
        Height = 22
        Anchors = [akTop, akRight]
        BiDiMode = bdLeftToRight
        Ctl3D = True
        EditMask = '0000;1;_'
        Font.Charset = ARABIC_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Library'
        Font.Style = []
        MaxLength = 4
        ParentBiDiMode = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Text = '    '
        OnKeyDown = ME_CodeKeyDown
      end
    end
    object AdvGroupBox6: TAdvGroupBox
      Left = 0
      Top = 352
      Width = 374
      Height = 56
      CaptionPosition = cpTopRight
      Align = alTop
      Caption = #1606#1605#1608#1583#1575#1585
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Library'
      Font.Style = []
      ParentCtl3D = True
      ParentFont = False
      TabOrder = 4
      DesignSize = (
        374
        56)
      object btn4: TAdvGlowButton
        Left = 212
        Top = 24
        Width = 26
        Height = 26
        Hint = #1584#1582#1610#1585#1607' '#1610' '#1593#1603#1587
        Anchors = [akTop, akRight]
        ImageIndex = 18
        Images = fMain.ilButton
        DisabledImages = fMain.ilButtonOff
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Library'
        NotesFont.Style = []
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btn4Click
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
      object btnChart: TAdvGlowButton
        Left = 120
        Top = 24
        Width = 86
        Height = 26
        Anchors = [akTop, akRight]
        Caption = #1585#1587#1605' '#1606#1605#1608#1583#1575#1585
        ImageIndex = 17
        Images = fMain.ilButton
        DisabledImages = fMain.ilButtonOff
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Library'
        NotesFont.Style = []
        TabOrder = 1
        OnClick = btnChartClick
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
    object AdvGroupBox7: TAdvGroupBox
      Left = 0
      Top = 0
      Width = 374
      Height = 81
      CaptionPosition = cpTopRight
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Library'
      Font.Style = []
      ParentCtl3D = True
      ParentFont = False
      TabOrder = 5
      DesignSize = (
        374
        81)
      object RG_TS: TAdvOfficeRadioGroup
        Left = 3
        Top = 3
        Width = 368
        Height = 75
        Version = '1.2.4.0'
        Align = alClient
        BiDiMode = bdRightToLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        ParentFont = False
        TabOrder = 0
        OnClick = btnChartClick
        ItemIndex = 0
        Items.Strings = (
          #1605#1587#1575#1576#1602#1575#1578' '#1576#1585#1583#1607' '#1588#1583#1607
          #1605#1587#1575#1576#1602#1575#1578' '#1570#1586#1575#1583)
        Ellipsis = True
      end
      object cbbMatch: TComboBox
        Left = 128
        Top = 13
        Width = 113
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        Text = #1607#1605#1607
        OnSelect = cbbMatchSelect
        Items.Strings = (
          #1607#1605#1607
          #1603#1578#1575#1576#8204#1582#1608#1575#1606#1740
          #1603#1575#1585#1593#1605#1604#1740
          #1607#1606#1585#1740
          #1670#1606#1583' '#1585#1587#1575#1606#1607#8204#1575#1740)
      end
      object cbbResume: TComboBox
        Left = 128
        Top = 40
        Width = 113
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Library'
        Font.Style = []
        ItemHeight = 13
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnSelect = cbbResumeSelect
      end
    end
  end
  object AdvPanel3: TAdvPanel
    Left = 0
    Top = 0
    Width = 416
    Height = 532
    Align = alClient
    BevelOuter = bvNone
    Color = 16445929
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -11
    Font.Name = 'Library'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    UseDockManager = True
    Version = '1.9.0.3'
    BorderColor = 16765615
    Caption.Color = 16773091
    Caption.ColorTo = 16765615
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'Library'
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
    StatusBar.Font.Name = 'Library'
    StatusBar.Font.Style = []
    StatusBar.Color = 16245715
    StatusBar.ColorTo = 16109747
    StatusBar.GradientDirection = gdVertical
    Styler = ps
    FullHeight = 15
    object cht: TDBAdvGDIPChartView
      Left = 0
      Top = 0
      Width = 416
      Height = 532
      ShowDesignHelper = False
      Align = alClient
      Panes = <
        item
          Bands.Distance = 2.000000000000000000
          Background.Font.Charset = DEFAULT_CHARSET
          Background.Font.Color = clWindowText
          Background.Font.Height = -11
          Background.Font.Name = 'Library'
          Background.Font.Style = []
          Background.Picture.Data = {}
          Background.GradientType = gtPath
          CrossHair.CrossHairYValues.Position = [chYAxis]
          CrossHair.Distance = 0
          Height = 100.000000000000000000
          Legend.Font.Charset = DEFAULT_CHARSET
          Legend.Font.Color = clWindowText
          Legend.Font.Height = -11
          Legend.Font.Name = 'Library'
          Legend.Font.Style = []
          Margin.LeftMargin = 10
          Margin.RightMargin = 10
          Margin.TopMargin = 10
          Name = 'ChartPane 0'
          Options = []
          Range.RangeTo = 9
          Series = <
            item
              AutoRange = arDisabled
              Pie.ValueFont.Charset = DEFAULT_CHARSET
              Pie.ValueFont.Color = clWindowText
              Pie.ValueFont.Height = -11
              Pie.ValueFont.Name = 'Library'
              Pie.ValueFont.Style = []
              Pie.LegendFont.Charset = DEFAULT_CHARSET
              Pie.LegendFont.Color = clWindowText
              Pie.LegendFont.Height = -11
              Pie.LegendFont.Name = 'Library'
              Pie.LegendFont.Style = []
              Annotations = <>
              ChartType = ctBar
              CrossHairYValue.BorderWidth = 0
              CrossHairYValue.Font.Charset = DEFAULT_CHARSET
              CrossHairYValue.Font.Color = clWindowText
              CrossHairYValue.Font.Height = -11
              CrossHairYValue.Font.Name = 'Library'
              CrossHairYValue.Font.Style = []
              CrossHairYValue.GradientSteps = 0
              LegendText = 'Serie 0'
              Marker.MarkerPicture.Data = {}
              Maximum = 12.000000000000000000
              Name = 'Serie 0'
              ChartPattern.Data = {}
              ValueFont.Charset = DEFAULT_CHARSET
              ValueFont.Color = clWindowText
              ValueFont.Height = -11
              ValueFont.Name = 'Library'
              ValueFont.Style = []
              ValueFormat = '%g'
              ValueWidth = 80
              XAxis.DateTimeFont.Charset = DEFAULT_CHARSET
              XAxis.DateTimeFont.Color = clWindowText
              XAxis.DateTimeFont.Height = -11
              XAxis.DateTimeFont.Name = 'Library'
              XAxis.DateTimeFont.Style = []
              XAxis.MajorFont.Charset = DEFAULT_CHARSET
              XAxis.MajorFont.Color = clWindowText
              XAxis.MajorFont.Height = -11
              XAxis.MajorFont.Name = 'Library'
              XAxis.MajorFont.Style = []
              XAxis.MajorUnit = 1.000000000000000000
              XAxis.MajorUnitSpacing = 0
              XAxis.MinorFont.Charset = DEFAULT_CHARSET
              XAxis.MinorFont.Color = clWindowText
              XAxis.MinorFont.Height = -11
              XAxis.MinorFont.Name = 'Library'
              XAxis.MinorFont.Style = []
              XAxis.MinorUnit = 1.000000000000000000
              XAxis.MinorUnitSpacing = 0
              XAxis.TextTop.Font.Charset = DEFAULT_CHARSET
              XAxis.TextTop.Font.Color = clWindowText
              XAxis.TextTop.Font.Height = -11
              XAxis.TextTop.Font.Name = 'Library'
              XAxis.TextTop.Font.Style = []
              XAxis.TextBottom.Font.Charset = DEFAULT_CHARSET
              XAxis.TextBottom.Font.Color = clWindowText
              XAxis.TextBottom.Font.Height = -11
              XAxis.TextBottom.Font.Name = 'Library'
              XAxis.TextBottom.Font.Style = []
              XAxis.TickMarkSize = 6
              YAxis.MajorFont.Charset = DEFAULT_CHARSET
              YAxis.MajorFont.Color = clWindowText
              YAxis.MajorFont.Height = -11
              YAxis.MajorFont.Name = 'Library'
              YAxis.MajorFont.Style = []
              YAxis.MajorUnit = 1.000000000000000000
              YAxis.MajorUnitSpacing = 0
              YAxis.MinorFont.Charset = DEFAULT_CHARSET
              YAxis.MinorFont.Color = clWindowText
              YAxis.MinorFont.Height = -11
              YAxis.MinorFont.Name = 'Library'
              YAxis.MinorFont.Style = []
              YAxis.MinorUnitSpacing = 10
              YAxis.TextLeft.Angle = -90
              YAxis.TextLeft.Font.Charset = DEFAULT_CHARSET
              YAxis.TextLeft.Font.Color = clWindowText
              YAxis.TextLeft.Font.Height = -11
              YAxis.TextLeft.Font.Name = 'Library'
              YAxis.TextLeft.Font.Style = []
              YAxis.TextRight.Angle = 90
              YAxis.TextRight.Font.Charset = DEFAULT_CHARSET
              YAxis.TextRight.Font.Color = clWindowText
              YAxis.TextRight.Font.Height = -11
              YAxis.TextRight.Font.Name = 'Library'
              YAxis.TextRight.Font.Style = []
              YAxis.TickMarkColor = clRed
              BarValueTextFont.Charset = DEFAULT_CHARSET
              BarValueTextFont.Color = clWindowText
              BarValueTextFont.Height = -11
              BarValueTextFont.Name = 'Library'
              BarValueTextFont.Style = []
              SerieType = stNormal
            end>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Library'
          Title.Font.Style = []
          Title.Position = tTop
          Title.Text = 'TAdvChartView'
          XAxis.Font.Charset = DEFAULT_CHARSET
          XAxis.Font.Color = clWindowText
          XAxis.Font.Height = -11
          XAxis.Font.Name = 'Library'
          XAxis.Font.Style = []
          XAxis.Text = 'X-axis'
          XGrid.MajorFont.Charset = DEFAULT_CHARSET
          XGrid.MajorFont.Color = clWindowText
          XGrid.MajorFont.Height = -11
          XGrid.MajorFont.Name = 'Library'
          XGrid.MajorFont.Style = []
          XGrid.MinorFont.Charset = DEFAULT_CHARSET
          XGrid.MinorFont.Color = clWindowText
          XGrid.MinorFont.Height = -11
          XGrid.MinorFont.Name = 'Library'
          XGrid.MinorFont.Style = []
          YAxis.Font.Charset = DEFAULT_CHARSET
          YAxis.Font.Color = clWindowText
          YAxis.Font.Height = -11
          YAxis.Font.Name = 'Library'
          YAxis.Font.Style = []
          YAxis.Size = 40
          YAxis.Text = 'Y-axis'
          YGrid.MinorDistance = 1.000000000000000000
          YGrid.MajorDistance = 2.000000000000000000
          ZoomControl.SliderLeftPicture.Data = {}
          ZoomControl.SliderRightPicture.Data = {}
        end>
      Tracker.Font.Charset = DEFAULT_CHARSET
      Tracker.Font.Color = clWindowText
      Tracker.Font.Height = -11
      Tracker.Font.Name = 'Library'
      Tracker.Font.Style = []
      Tracker.Title.Font.Charset = DEFAULT_CHARSET
      Tracker.Title.Font.Color = clWindowText
      Tracker.Title.Font.Height = -11
      Tracker.Title.Font.Name = 'Library'
      Tracker.Title.Font.Style = []
      Tracker.Title.Text = 'TRACKER'
      Version = '2.5.1.2 DEC, 2009'
      XAxisZoomSensitivity = 1.000000000000000000
      YAxisZoomSensitivity = 1.000000000000000000
    end
  end
  object qryGetMatch: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 48
    Top = 328
  end
  object dlg1: TSavePictureDialog
    Filter = 'JPEG Image File |*.jpg'
    Left = 16
    Top = 280
  end
  object qryTemp: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 48
    Top = 376
  end
  object fs: TAdvFormStyler
    Style = tsOffice2007Luna
    AppStyle = fMain.apps
    Left = 8
    Top = 144
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
    Settings.Caption.Font.Name = 'Library'
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
    Settings.Font.Name = 'Library'
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
    Settings.StatusBar.Font.Name = 'Library'
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
    Top = 144
  end
  object AQTemp: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Prize.Name, Prize.Score, Prize.Description'
      'FROM Prize'
      'WHERE (((Prize.Score)>0))'
      'ORDER BY Prize.Score DESC;')
    Left = 16
    Top = 372
  end
  object AQGtemp: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Resume.ObjectName, Resume.Score, Resume.Date'
      'FROM Resume;')
    Left = 16
    Top = 328
  end
  object dsChart: TDataSource
    DataSet = qryGetMatch
    Left = 168
    Top = 184
  end
end
