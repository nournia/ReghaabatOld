object F_ShowPrize: TF_ShowPrize
  Left = 0
  Top = 0
  BiDiMode = bdRightToLeft
  ClientHeight = 456
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object P_SetScore: TAdvPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 65
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
    Visible = False
    Version = '1.9.0.3'
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
    Styler = AdvPanelStyler1
    DesignSize = (
      650
      65)
    FullHeight = 0
    object L_Score: TLabel
      Left = 91
      Top = 10
      Width = 5
      Height = 16
      BiDiMode = bdRightToLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -13
      Font.Name = 'Library'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 98
      Top = 10
      Width = 46
      Height = 16
      BiDiMode = bdRightToLeft
      Caption = #1575#1605#1578#1610#1575#1586' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -13
      Font.Name = 'Library'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Transparent = True
    end
    object L_Name: TLabel
      Left = 553
      Top = 10
      Width = 5
      Height = 16
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -13
      Font.Name = 'Library'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 558
      Top = 10
      Width = 68
      Height = 16
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = #1606#1575#1605' '#1580#1575#1610#1586#1607' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -13
      Font.Name = 'Library'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 561
      Top = 37
      Width = 67
      Height = 16
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Caption = #1578#1608#1590#1610#1581#1575#1578' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -13
      Font.Name = 'Library'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Transparent = True
    end
    object L_Description: TLabel
      Left = 554
      Top = 37
      Width = 5
      Height = 16
      Anchors = [akTop, akRight]
      BiDiMode = bdRightToLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7485192
      Font.Height = -13
      Font.Name = 'Library'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Transparent = True
    end
  end
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 65
    Width = 650
    Height = 349
    Align = alClient
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
    Version = '1.9.0.3'
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
    Styler = AdvPanelStyler1
    FullHeight = 0
    object MainPicture: TImage
      Left = 31
      Top = 0
      Width = 588
      Height = 349
      Align = alClient
      Center = True
      Proportional = True
      Stretch = True
      ExplicitLeft = 25
    end
    object BitBtn1: TAdvGlowButton
      Left = 0
      Top = 0
      Width = 31
      Height = 349
      Align = alLeft
      BorderStyle = bsNone
      ImageIndex = 12
      Images = F_Main.ilButton
      DisabledImages = F_Main.ilButtonOff
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Transparent = True
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TAdvGlowButton
      Left = 619
      Top = 0
      Width = 31
      Height = 349
      Align = alRight
      BorderStyle = bsNone
      ImageIndex = 13
      Images = F_Main.ilButton
      DisabledImages = F_Main.ilButtonOff
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Transparent = True
      TabOrder = 1
      OnClick = BitBtn1Click
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
  object AdvPanel2: TAdvPanel
    Left = 0
    Top = 414
    Width = 650
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    Color = 16445929
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -11
    Font.Name = 'Tahoma'
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
    Styler = AdvPanelStyler1
    DesignSize = (
      650
      42)
    FullHeight = 0
    object BitBtn4: TAdvGlowButton
      Left = 11
      Top = 6
      Width = 32
      Height = 32
      BorderStyle = bsNone
      ImageIndex = 15
      Images = F_Main.ilButton
      DisabledImages = F_Main.ilButtonOff
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      Transparent = True
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
    end
    object TrackBar: TAdvTrackBar
      Left = 64
      Top = 8
      Width = 549
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      BorderColor = clNone
      BorderColorDisabled = clNone
      Buttons.BorderColor = 14727579
      Buttons.BorderColorHot = 10079963
      Buttons.BorderColorDown = 4548219
      Buttons.Color = 15653832
      Buttons.ColorTo = 16178633
      Buttons.ColorHot = 15465983
      Buttons.ColorHotTo = 11332863
      Buttons.ColorDown = 7778289
      Buttons.ColorDownTo = 4296947
      Buttons.ColorMirror = 15586496
      Buttons.ColorMirrorTo = 16245200
      Buttons.ColorMirrorHot = 5888767
      Buttons.ColorMirrorHotTo = 10807807
      Buttons.ColorMirrorDown = 946929
      Buttons.ColorMirrorDownTo = 5021693
      Buttons.GradientMirror = ggVertical
      Buttons.MinPicture.Data = {
        89504E470D0A1A0A0000000D4948445200000014000000150803000000710B3E
        9A00000015744558744372656174696F6E2054696D650007D7070C11282095CF
        41CA0000000774494D4507D7070C112B251B8905F6000000097048597300000B
        1200000B1201D2DD7EFC00000300504C544500069A00089B000A9D00119D0016
        9F0016A1001AA0001DA1041CA20519A80618A80812A10A15A30D14A40D1FA508
        2E9F0021A40027A50026A70025A80028A60028A8002FA90F22A60A2EA40736A3
        0034AC063EA9003BB1013CB0003DB2003EB3113ABF123ABF2235AE0046BB064B
        B4004CBD1E44AC2148B5294FB82B4EBB294EBC2054B3344DAC354BB9354CBA3B
        46B63556B6395CB73B5DBD3C5DBB3C5DBD336DBD3F62BF004DC00353C20052C6
        0056C90057CB055DC5005BCA015CCB0854C20060D30066D9016ADC016CDC016C
        DE056DDA066FDB0A6CD2016FE0057AE7047AE8266FD42770D33E63C14160BB44
        63BE4862BC4965BE4F69BF497EB9497EBA687FBE4164C14A66C44D67C44969C2
        4B6CC44F69C05069C0516EC0566DC25471C55576CA5971C55974C65D73C55D75
        C66274C16377C56677C46578C7667CCA687FC86D7CC80B81E70A83EC0A84EB0B
        86EB0E8AED0F8BEE1189E9108DEE1896F01C9AF21E9DF21F9FF32180D33683C7
        3290E620A0F224A6F427A8F428AAF52CAFF62CB0F634B9F839BFF93ABFF93CC2
        FA5989BD7383B97282BD4C83C05B93C243A1DF6680CD6882CD6C81CB6785D069
        86D06C88D16F8FD67985CB7B86CC7A8BCF7D88CD738FD2778BD0788BD0788DD1
        7691C47190D67991D47C92D47E99D944C8FA45CCFC55D6FE56D6FE62C7EF63C8
        EF61DBFE62DCFE64DDFE79EDFD7DECFE7EEDFEFF40FFA1ACBAACB2BA828CCE84
        8ECF848FD0839AC58396D0819FDC8991D18B99D28A9AD68E9ED78B9ED89499CF
        9197D3939BD5939CD586A2DC88A7DF8DA3DB97A9C395A0D793AADF9BA1D59DA2
        D89FA5D99AA8DB93B2E49FBAE7A3ABC7A8AECDA4ACD3A1A8DAA3AFDFA5A8DAA8
        B2DFAEB1DDA0B3E1A1B4E1A6B3E1A7B9E4A2BEE9A7BEE8A8B5E0AEB7E1ABBBE4
        B0B6E0B2B9E1B0BDE4B5BAE2B7BFE2B7BEE480EAFFA9C2EAB6C3E7BFC1E4B9C9
        EBBDCAEAC2C4C7C7C7C7C7C7C8CCCFD6D8D8D8C2C6E7C4C6E6C0C9E6C0C9E8C1
        CCEAC4CAE9CDD1EBCCD3EDCED6EFD0D6E3D0D5EDE9E9E9E4E7F2E4E8F4E8EBF4
        EAEEF8F1F2F9F6F7F9F9F9F9F9FAFCFEFEFE742513FA000000AC74524E53FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00059515B1000001964944415478DA63580D066F1FDDB8
        7FEFD6A377101E0388787FF6D3D7378F1FBFF9FCF9F23B98E0C5A7AF2F9C3B72
        F8C89173B73EBCBF0411BCF8E4F6D15D5BD64D9EBA7ECB9E33779F5E02095EBF
        767ECFFAC9D9E919A919D993361CBCF1F0265070EFA56D33B253E262A2A3D3A7
        A4F44ED97E65DF6A86632776CCC84C8C09F4F7DFFAFD77744AE6CCFD57EF30F4
        1F9AD31D1F19669CF5F1DFFFFF7E91493D738F4F63089FD7971065167BFDF77F
        2030348B4A98B03982416F628289C1A61FFFC1404D5DC32461B62E038F923887
        CE9F7F7FC1805F5080834F899B818991995D22F4CB37309014136163666062E0
        6562159592D5DEF8F2151048CB4909B130F232E8730ACB2A9B5B5A981E78F6E2
        858AB9B28C28973EC34E4579556B0747170FF78E356B6D1CAC54E5157732ACD6
        B2B773F2CA2D282E2EAAA8CCF174B6B3D7047AF3B48F6B5E49754D6D5D5D6D4D
        7549BE9BF7695028B55795363436B7004153634359553B243CDBBAE62F58B474
        F9F2650B17CCEF6A8385FCA9E0C52B563E78B06AC5929053F0E858BDFAE4ACD6
        CECED65927213C00583CE8A1E1D731220000000049454E44AE426082}
      Buttons.MinPictureHot.Data = {
        89504E470D0A1A0A0000000D4948445200000014000000150803000000710B3E
        9A00000015744558744372656174696F6E2054696D650007D7070C112D00D3D6
        95470000000774494D4507D7070C113104E7CDEF73000000097048597300000B
        1200000B1201D2DD7EFC00000300504C5445002BC9002CCB002DCC002ECC022A
        D40033D30034D40037D7053BD70038D8003CDE053DDC053EDC0B33D40C35D50E
        33D90E34DA0948DA0A4ADF0B51DD1043D61145D7115EDC0042E30046E50046E8
        014FF00059EF005AEF0256F2035BF21159EB125AEB196CDC0960EF0861F40C6C
        F50C70F50C74F71B79EB1375F6177BF7235FDC2959D62A5BD72E5CDE2B70DE36
        62D62364E72669EB2B67E93B62E03471E93C73E14378DF4D7CDE416EE2477CE6
        507FE31780F71682F72682DF208BF82D8DF72D8EF72594F92595FA2794F92797
        F92C9AF92E9CF83294E635A8FA3BADF53CB2FB3CB2FC4787D45882DE4B82E74B
        82E84D81E94C84EA4E84EB4D86EC5284EA578AEA5885E65B87E75886E85988E3
        598BEA5A89E8588DEB5B8DE85A8EEB5D8DE85693EA5C93EF5C95EF49A5DD55A0
        D043B7F741B8FC43BAFC44BBFC4BB2FB698FDE639ACA608BE7688CE16590E865
        93E96692E86794E96990E46991E66D91E56E94E4689AE96A99EA6C9BEA7596E6
        7595EB7595EC749AE6779BE6769CE77B98E67F9DE67898EC61BDF962BDF970A2
        ED77A0E87AA2E97FA9EA7DAFED77A7F17EB0ED4BC4FD4BC4FE4EC8FE53CEFE54
        CEFE59D4FE5BD7FF5CD8FF5FDBFF60DCFF6AE5FF6FEAFF72ECFF78EDFE79EEFE
        7AF2FFFF40FFA5B1BBAFB5BA809EE6829DE4849EE589A6D59DB1C987A0E686A6
        E781ABEB85A9EA86A9E888A1E688A6E58DA6E688A8E889ABE98EA9E887B5EE8A
        B7EE8CB1EA8FB3EB93A5EA98ACE89EAFE899B5EA9BB7EA9DB3EA9FB5EA9CBBEC
        9FBEEDA1B2E8A2B7EFA4B6EAA6B8EAA8B7E9A9B8EAA2BAF0A4BAF18EDBFC99C0
        EE9DC4F09FC8F386F4FE8EF4FE91F5FDA9C6EFACC0ECA6C6F0A2CBF3A6C8F0A8
        C8F1ABCEF2B3C7EEB4C2ECB9C8EFB1CEF3B3CDF2B3CEF0B3CFF2B4C9F1B7CAF0
        BCCBF0B1D3F3B8D2F2BBD6F4BDD7F4BED7F5B8DAF6BCDBF6BDDFF8A7F8FCA9F9
        FDAAF8FEC3C5C7C7C7C7C8C8C8CDD1D8D8D8D8C1CBEFC5CFF1CFD7E7C6D1F1C0
        DEF7C6DBF6CBD6F3C8DEF6CCD8F4D2DBF4D4DCF4CCE2F7D5E1F7E9E9E9EAEAEA
        E4EAF8F2F5FCF6F7FAFAFAFAFAFBFDFFFFFFD026863E0000009C74524E53FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00BF675F1B0000
        01974944415478DA63980D0677AE9EBA71E3D4F53B101E0388B87BE6FB9777AF
        5FBFFBFAFDDC5D98E0F90FEF2E1DD8BD65CBEE03973E7E3A07113CF5E9F2DECD
        AB162F58B062EDE603B7BE9D0709DE7B7871FBAA86CA929292D2CA796B77DC7C
        7F1F2878ECEAD62575C539E11161B90B8A6A576FBB731628F860E7B2BABCE890
        00ABB5BF7EFB16D4ADD9F5E80A43C7850DADF9A14196A59FFFFDFF6F1E55D8B6
        F1761743EC91F6F298C0C8D3BFFF038159705CC5D2A3F10C16EBCAFC4D57FEFA
        0F065A86267E65EB2D18F8744479F4FFFC85004149716E116D5E061646362EA1
        ACB73F7FFEF8F1F3A7B09424172B030B830033A7A4AC92DEC297AF80404C5956
        929D899F419743424E454353DD67D1B3E72F143554E424388C19EAE56554ADED
        9C5DDDDCB3E7CCB5B5B3569551D8C430DB48CDC6C5C33B2D3D233539C5D3C3C5
        46CD00E8A33D0E4EDE3DFD13264E9A3471427FB7B793C33250285567F64E993A
        6D3A104C9B3AA537B30A129E8D4D33671D3F71F2E489E3B3663637C242FE50E2
        E1A74F1E3F79F2F470D22178740085135A3A3B5B120E4278007079E77135BF8C
        300000000049454E44AE426082}
      Buttons.MinPictureDown.Data = {
        89504E470D0A1A0A0000000D4948445200000014000000150803000000710B3E
        9A00000015744558744372656174696F6E2054696D650007D7070C11310ED219
        E51D0000000774494D4507D7070C11360CA657F186000000097048597300000B
        1200000B1201D2DD7EFC00000300504C544501003402003E080A37080A380300
        4303004704004604004E04054F04064F07054F07094900015705005005005307
        055002025902035D0D0F510E1053030760000960030861000F68090F620C0D60
        03136303146400106800176F00196F011B6F0816670119720722710025790026
        79002D7F002E7E06317B1D246F1D28601E28611B24722C3A5E283074303A7B39
        387836447E3D447E3E527042487E474C7D484D7E002C80012D82003381033580
        003A88013F8D05388B05398C1B34801D3580213B80353F8404408700418C0140
        8E00428C004590004994004A96014C96084C9304509904509A0756A20158A502
        5FAF0161B20464B20267BA0368BC026ABE1567AF3940803A44823F488635598F
        2C6EAA0778CA0B7FCE1175C01177C2434F86444984444D83454E83474E804450
        874950874D53804F57854A5E8F4E59884F5B894E5D8D4F5F8E4D569151598455
        5982545B86585C844B729F5C61865A648B5B668C5D65895A60915E62915E6292
        5B69905C6B915E70975F729863698B666A8B646A8C696C8C656B9F6972916A74
        926975946D72906F74936B7A9A6C7D9C707E90747995797D967B7F98686FA060
        7AA1627CA3757BA50B80CF0D83D2128AD7148DD9148ED91996DD1A97DE399ED6
        24A4E629ABEB2BABEB2AACEB2EAFEA2EAFED2FB0EA2EB0ED2EB1EE38BDF439BE
        F43FC5F865819B67839D6A82966B83986D859A76819B7A809A78839C7E839C7F
        849C6C88B86E89B86C8FBE6E90BE7187A7738BAA7887A07A8AA2519CD269BBE4
        40C6F846CAFA4ACCFC55D5FD56D6FD6FE1FE76E3FEFF40FF80859D888EA38A8F
        A48187B2888CB48595A78299AD839CAB859AA98A93A88D95A98B9AAA899AAD83
        90B08096B0819BB4849BB4859FB7889BB08E9EB09097AB9298AB969DAF989EB1
        8FA0B192A3B496A0B096A2B59AA1B39EA5B7A0A7B8A0A9B3ADB1B6ABB0B89FA7
        C489BEE2A0A7C3A7ABCAA8B5C1A9BCC9A1B1D1C3C4C6C7C7C7C8C8C8CCCED3CA
        CCDECDD2D6CFD1DBD0D6DBD8D8D8C7D3E4CED1E2CBD9EAD5DBE0E2E4EEE9E9E9
        EAEAEAF1F2F7F6F6F8FAFAFAFAFAFCFFFFFF728B4333000000C274524E53FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        D2A7D936000001904944415478DA633808018F577575AD7A0CE5308088972B6E
        DCBF71FDFA8D077756C2054F1EBF79787D6F4F4FEFA123F7CE9E84089EBA7566
        7D775B637D7D635BF7A1EBB74F81045F9E38BDA6ADAEB830BFA0B0ACA17DCDB5
        1320C1656757379715A4999A24974F2C286B597B75F941861717B7B596A49B1A
        1B261CFBF13B35ABB475FBE5170C572E745465261A8635BDFFF7FF7F44525675
        E7A52B0C465B6AB2E3C3739FFFFE0F048EE12939B55B8D1874FA330CF48EFEF8
        0F06DA1ABA061913741898B584B9F4FFFC850009013E2E214D26060646565EC9
        BE8FBF7EFDFCF9EB9782A8002F1B230303370BAFA08CBCC3F9779F8140494E5C
        909D859BA18243445645CDC232F2EEEB376FD5D59465C5382B199E4829AA5AB9
        BAB97B78153D7CE4E46A65A628FD8CE1A09D998BA75F40504848706894BF9FA7
        8BB93DD09BAF6C7C02A3274F99060453264707FAD8824369836FCC8C5973162D
        5AB470EEAC19937C3742C27353ECECC5BB76EFD9B37BD792B9719B61217F70C7
        BC7DFB0F1CD8BF6FC10E447400C1D39D3367EE7C0AE50000C6EAEDD9CA9F19A3
        0000000049454E44AE426082}
      Buttons.MaxPicture.Data = {
        89504E470D0A1A0A0000000D4948445200000014000000150803000000710B3E
        9A00000015744558744372656174696F6E2054696D650007D7070C11282095CF
        41CA0000000774494D4507D7070C112B1934E67971000000097048597300000B
        1200000B1201D2DD7EFC00000300504C544500069A00089B000A9D00119D0016
        9F0016A1001AA0001DA1041CA20519A80618A80812A10A15A30D14A40D1FA508
        2E9F0021A40027A50026A70025A80028A60028A8002FA90F22A60A2EA40736A3
        0034AC063EA9003BB1013CB0003DB2003EB3113ABF123ABF2235AE0046BB064B
        B4004CBD1E44AC2148B5294FB82B4EBB294EBC2054B3344DAC354BB9354CBA3B
        46B63556B6395CB73B5DBD3C5DBB3C5DBD336DBD3F62BF004DC00353C20052C6
        0056C90057CB055DC5005BCA015CCB0854C20060D30066D9016ADC016CDC016C
        DE056DDA066FDB0A6CD2016FE0057AE7047AE8266FD42770D33E63C14160BB44
        63BE4862BC4965BE4F69BF497EB9497EBA687FBE4164C14A66C44D67C44969C2
        4B6CC44F69C05069C0516EC0566DC25471C55576CA5971C55974C65D73C55D75
        C66274C16377C56677C46578C7667CCA687FC86D7CC80B81E70A83EC0A84EB0B
        86EB0E8AED0F8BEE1189E9108DEE1896F01C9AF21E9DF21F9FF32180D33683C7
        3290E620A0F224A6F427A8F428AAF52CAFF62CB0F634B9F839BFF93ABFF93CC2
        FA5989BD7383B97282BD4C83C05B93C243A1DF6680CD6882CD6C81CB6785D069
        86D06C88D16F8FD67985CB7B86CC7A8BCF7D88CD738FD2778BD0788BD0788DD1
        7691C47190D67991D47C92D47E99D944C8FA45CCFC55D6FE56D6FE62C7EF63C8
        EF61DBFE62DCFE64DDFE79EDFD7DECFE7EEDFEFF40FFA1ACBAACB2BA828CCE84
        8ECF848FD0839AC58396D0819FDC8991D18B99D28A9AD68E9ED78B9ED89499CF
        9197D3939BD5939CD586A2DC88A7DF8DA3DB97A9C395A0D793AADF9BA1D59DA2
        D89FA5D99AA8DB93B2E49FBAE7A3ABC7A8AECDA4ACD3A1A8DAA3AFDFA5A8DAA8
        B2DFAEB1DDA0B3E1A1B4E1A6B3E1A7B9E4A2BEE9A7BEE8A8B5E0AEB7E1ABBBE4
        B0B6E0B2B9E1B0BDE4B5BAE2B7BFE2B7BEE480EAFFA9C2EAB6C3E7BFC1E4B9C9
        EBBDCAEAC2C4C7C7C7C7C7C7C8CCCFD6D8D8D8C2C6E7C4C6E6C0C9E6C0C9E8C1
        CCEAC4CAE9CDD1EBCCD3EDCED6EFD0D6E3D0D5EDE9E9E9E4E7F2E4E8F4E8EBF4
        EAEEF8F1F2F9F6F7F9F9F9F9F9FAFCFEFEFE742513FA000000AC74524E53FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00059515B1000001954944415478DA63580D06EF1EDDBA
        77FFC6A3B7101E0358E8F2E7CF6F1E3F7EF3F5D3D9F730C14BEF3FDC3A77E4C8
        E123E72EBC7E7A112278E9E9DD337BB6AC9F3A79DD965D476F3FB90812BCF9F0
        C6C10D93B2335233D2B327AFDF73FEDA75A0E0BE2BDBA7F4A64C498F8E8E894B
        C99EB1EDD2DED50C77AEEE9F999912FDFBFB567FFFC098C4CC193B4E1C639876
        7C6E4F52A4DFFFFFFF3E66198745C677CF39D4CF10B17942429499E17F20F87D
        3DD62C2AA16F5E3883EEEC04130D75B5FF60F063938149C2443D066E253E0E01
        41FEBF60F0EF8F0E87B8120F031303339B8898E43730F8122AC1CECCC8C4C0CB
        C822242527FD0A085E6ED49695126565E265D0E7129551365779F1E2D901530B
        4B736559614E7D869D8AF2AA560E366BD774B87BB8383A58ABCA2BEE6458AD69
        6FE7EC99535951545C5C90EBE56467AF05F4E6696FB7FC92EA9ADABABADA9AEA
        923C579FD3A0506AAF2A6B686C6A0182E6C686D2AA764878B675CD5FB070D9F2
        E54B172D98DFD5060BF953214B56AC7AF060E58AC5C1A7E0D1B17AF5C959AD9D
        9DADB34E4278005426E8A1A4BEDABC0000000049454E44AE426082}
      Buttons.MaxPictureHot.Data = {
        89504E470D0A1A0A0000000D4948445200000014000000150803000000710B3E
        9A00000015744558744372656174696F6E2054696D650007D7070C112D00D3D6
        95470000000774494D4507D7070C113034D80FEE9E000000097048597300000B
        1200000B1201D2DD7EFC00000300504C5445002BC9002CCB002DCC002ECC022A
        D40033D30034D40037D7053BD70038D8003CDE053DDC053EDC0B33D40C35D50E
        33D90E34DA0948DA0A4ADF0B51DD1043D61145D7115EDC0042E30046E50046E8
        014FF00059EF005AEF0256F2035BF21159EB125AEB196CDC0960EF0861F40C6C
        F50C70F50C74F71B79EB1375F6177BF7235FDC2959D62A5BD72E5CDE2B70DE36
        62D62364E72669EB2B67E93B62E03471E93C73E14378DF4D7CDE416EE2477CE6
        507FE31780F71682F72682DF208BF82D8DF72D8EF72594F92595FA2794F92797
        F92C9AF92E9CF83294E635A8FA3BADF53CB2FB3CB2FC4787D45882DE4B82E74B
        82E84D81E94C84EA4E84EB4D86EC5284EA578AEA5885E65B87E75886E85988E3
        598BEA5A89E8588DEB5B8DE85A8EEB5D8DE85693EA5C93EF5C95EF49A5DD55A0
        D043B7F741B8FC43BAFC44BBFC4BB2FB698FDE639ACA608BE7688CE16590E865
        93E96692E86794E96990E46991E66D91E56E94E4689AE96A99EA6C9BEA7596E6
        7595EB7595EC749AE6779BE6769CE77B98E67F9DE67898EC61BDF962BDF970A2
        ED77A0E87AA2E97FA9EA7DAFED77A7F17EB0ED4BC4FD4BC4FE4EC8FE53CEFE54
        CEFE59D4FE5BD7FF5CD8FF5FDBFF60DCFF6AE5FF6FEAFF72ECFF78EDFE79EEFE
        7AF2FFFF40FFA5B1BBAFB5BA809EE6829DE4849EE589A6D59DB1C987A0E686A6
        E781ABEB85A9EA86A9E888A1E688A6E58DA6E688A8E889ABE98EA9E887B5EE8A
        B7EE8CB1EA8FB3EB93A5EA98ACE89EAFE899B5EA9BB7EA9DB3EA9FB5EA9CBBEC
        9FBEEDA1B2E8A2B7EFA4B6EAA6B8EAA8B7E9A9B8EAA2BAF0A4BAF18EDBFC99C0
        EE9DC4F09FC8F386F4FE8EF4FE91F5FDA9C6EFACC0ECA6C6F0A2CBF3A6C8F0A8
        C8F1ABCEF2B3C7EEB4C2ECB9C8EFB1CEF3B3CDF2B3CEF0B3CFF2B4C9F1B7CAF0
        BCCBF0B1D3F3B8D2F2BBD6F4BDD7F4BED7F5B8DAF6BCDBF6BDDFF8A7F8FCA9F9
        FDAAF8FEC3C5C7C7C7C7C8C8C8CDD1D8D8D8D8C1CBEFC5CFF1CFD7E7C6D1F1C0
        DEF7C6DBF6CBD6F3C8DEF6CCD8F4D2DBF4D4DCF4CCE2F7D5E1F7E9E9E9EAEAEA
        E4EAF8F2F5FCF6F7FAFAFAFAFAFBFDFFFFFFD026863E0000009C74524E53FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00BF675F1B0000
        019A4944415478DA63980D0677AE9FBA71E3D4D53B101E0388B87BEEFBD777AF
        5FBFFBF2FDCC5D98E0B94F1F2F1DD8BD65CBEE0397DE7D380F113CFFEDD681CD
        6B572C58B078D5E6BD973F9D0209DE7F7F73C7DA7995A5252525950DABB65F7C
        780F2878F6CEB6D5B5450B72C322C2738AEB966CBD7A6C36C39547BBD6D415F8
        FEFEB5D62A20243AAF6ED9CE07B319BA6E6F6C2B8C32FFFFFFDFE752CBA0D0FC
        D60D173A18E28F2EAD880B36FB0F04BF4F4706C694B71F8965B0585FE66762A8
        F51F0C7EAD34F52F5B67C1C0AB2DC22D2E29F81702FEE8F388EAF031B030B072
        494A09FFFCF9E3C7CF9F6FB384B8D8185918F899D8256595C55E01C1CB857A4A
        B2929CCC020CC61C12722A1A8A2F9E3F5BE4A3AEA9A12227C1A1CBB0494146D5
        DACE76EE9C6C773757673B6B5519F97A86D9066A362E1E9E29C9A919E969DE1E
        2E366A46406F2E7370F2EEEE9F3071D2A48913FA7BBC9D1CF68042A92AB377CA
        D469D38160DAD429BD99D590F06C6C9E39EBF88993274F1C9F35B3A91116F287
        920E3F7DF2E4F193A787130FC1A363F6EC83092D9D9D2D0987203C007211E771
        A17003280000000049454E44AE426082}
      Buttons.MaxPictureDown.Data = {
        89504E470D0A1A0A0000000D4948445200000014000000150803000000710B3E
        9A00000015744558744372656174696F6E2054696D650007D7070C11310ED219
        E51D0000000774494D4507D7070C113520BFA2CEA6000000097048597300000B
        1200000B1201D2DD7EFC00000300504C544501003402003E080A37080A380300
        4303004704004604004E04054F04064F07054F07094900015705005005005307
        055002025902035D0D0F510E1053030760000960030861000F68090F620C0D60
        03136303146400106800176F00196F011B6F0816670119720722710025790026
        79002D7F002E7E06317B1D246F1D28601E28611B24722C3A5E283074303A7B39
        387836447E3D447E3E527042487E474C7D484D7E002C80012D82003381033580
        003A88013F8D05388B05398C1B34801D3580213B80353F8404408700418C0140
        8E00428C004590004994004A96014C96084C9304509904509A0756A20158A502
        5FAF0161B20464B20267BA0368BC026ABE1567AF3940803A44823F488635598F
        2C6EAA0778CA0B7FCE1175C01177C2434F86444984444D83454E83474E804450
        874950874D53804F57854A5E8F4E59884F5B894E5D8D4F5F8E4D569151598455
        5982545B86585C844B729F5C61865A648B5B668C5D65895A60915E62915E6292
        5B69905C6B915E70975F729863698B666A8B646A8C696C8C656B9F6972916A74
        926975946D72906F74936B7A9A6C7D9C707E90747995797D967B7F98686FA060
        7AA1627CA3757BA50B80CF0D83D2128AD7148DD9148ED91996DD1A97DE399ED6
        24A4E629ABEB2BABEB2AACEB2EAFEA2EAFED2FB0EA2EB0ED2EB1EE38BDF439BE
        F43FC5F865819B67839D6A82966B83986D859A76819B7A809A78839C7E839C7F
        849C6C88B86E89B86C8FBE6E90BE7187A7738BAA7887A07A8AA2519CD269BBE4
        40C6F846CAFA4ACCFC55D5FD56D6FD6FE1FE76E3FEFF40FF80859D888EA38A8F
        A48187B2888CB48595A78299AD839CAB859AA98A93A88D95A98B9AAA899AAD83
        90B08096B0819BB4849BB4859FB7889BB08E9EB09097AB9298AB969DAF989EB1
        8FA0B192A3B496A0B096A2B59AA1B39EA5B7A0A7B8A0A9B3ADB1B6ABB0B89FA7
        C489BEE2A0A7C3A7ABCAA8B5C1A9BCC9A1B1D1C3C4C6C7C7C7C8C8C8CCCED3CA
        CCDECDD2D6CFD1DBD0D6DBD8D8D8C7D3E4CED1E2CBD9EAD5DBE0E2E4EEE9E9E9
        EAEAEAF1F2F7F6F6F8FAFAFAFAFAFCFFFFFF728B4333000000C274524E53FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        D2A7D9360000018F4944415478DA633808018F577575AD7A0CE53080C995771E
        DCB87EFDC6FD1B2B5EC2044F9EBD77E4506F4F4FEFFAC3378F9F84089EBA7DFD
        50775B637D7D635BF7FA33B74E81054F5C5BD3DE505658905F585CD7B6E6F489
        9740C1E557D7B694154C2C4F36314D2B286B5E7D76D941861797B7B79666A5FE
        FE712CC1D0D834BDA475DBC5170C572E7556672545FCFFFFEF7D539861626655
        C7852B0C465B6B7352C21DFF03C1EFE7B9E1F1D9355B8C1874266418E86A68FF
        07831F47F50C32FA7518983485B8F80424FE42C01F7D2E612D66060646365E01
        51855FBF7EFEFCF5EB639F242F2B230303370BBBA0B89CD267207877DE415E46
        9097859BA192534C56594DFDED9BD777232D2DD4546445382A189E492B9A59B9
        3A3D7A58E4E5E1EEE66AA5AA28F584E1A0BDB98BA79F7F546870484850809FA7
        8B991DC8EFB63E81D193A74C03822993A3037D6C5E810437FA4E9A316BEEC245
        8B16CD993523C67703243C37C7CD5DB26BF79E3DBB772D9E1DBB091EF23B16EC
        DB7FE0C0FE7DF3762045C7C1834F77CE9CB9F329940300BB1AEDD9E7900B3E00
        00000049454E44AE426082}
      ColorTo = clNone
      ColorDisabled = clNone
      ColorDisabledTo = clNone
      Direction = gdHorizontal
      Color = clNone
      Max = 2000
      Position = 1000
      Slider.BorderColor = 12752500
      Slider.BorderColorDisabled = clNone
      Slider.Color = clSilver
      Slider.ColorTo = clSilver
      Slider.ColorDisabled = clBlack
      Slider.ColorDisabledTo = clBlack
      Slider.ColorCompleted = 14922881
      Slider.ColorCompletedTo = 13334870
      Slider.ColorCompletedDisabled = clNone
      Slider.ColorCompletedDisabledTo = clNone
      Slider.Direction = gdHorizontal
      Slider.Size = 4
      Slider.Border3D = False
      Slider.Rounded = True
      TabOrder = 1
      Thumb.BorderColor = 14727579
      Thumb.BorderColorHot = 10079963
      Thumb.BorderColorDown = 4548219
      Thumb.BorderColorDisabled = clBlack
      Thumb.Color = 15653832
      Thumb.ColorTo = 16178633
      Thumb.ColorDown = 7778289
      Thumb.ColorDownTo = 4296947
      Thumb.ColorHot = 15465983
      Thumb.ColorHotTo = 11332863
      Thumb.ColorDisabled = clBlack
      Thumb.ColorDisabledTo = clBlack
      Thumb.ColorMirror = 15586496
      Thumb.ColorMirrorTo = 16245200
      Thumb.ColorMirrorHot = 5888767
      Thumb.ColorMirrorHotTo = 10807807
      Thumb.ColorMirrorDown = 946929
      Thumb.ColorMirrorDownTo = 5021693
      Thumb.ColorMirrorDisabled = clBlack
      Thumb.ColorMirrorDisabledTo = clBlack
      Thumb.Gradient = ggVertical
      Thumb.GradientMirror = ggVertical
      Thumb.Shape = tsPointer
      TickMark.Color = 12752500
      TickMark.ColorDisabled = clBlack
      TickMark.Font.Charset = DEFAULT_CHARSET
      TickMark.Font.Color = clWindowText
      TickMark.Font.Height = -11
      TickMark.Font.Name = 'Tahoma'
      TickMark.Font.Style = []
      TickMark.Style = tsNone
      TrackHint = False
      TrackLabel.Font.Charset = DEFAULT_CHARSET
      TrackLabel.Font.Color = clWindowText
      TrackLabel.Font.Height = -11
      TrackLabel.Font.Name = 'Tahoma'
      TrackLabel.Font.Style = []
      TrackLabel.Format = 'Pos: %d'
      Version = '1.5.0.0'
      OnChange = TrackBarChange
    end
  end
  object AQ_Prize: TADOQuery
    Connection = F_Main.MatchConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Prize.*'
      'FROM Prize'
      'ORDER BY Prize.Score DESC;')
    Left = 30
    Top = 73
  end
  object Timer: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimerTimer
    Left = 95
    Top = 73
  end
  object AdvPanelStyler1: TAdvPanelStyler
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
  object AdvFormStyler: TAdvFormStyler
    Style = tsOffice2007Luna
    AppStyle = F_Main.AdvAppStyler
    Left = 8
    Top = 8
  end
end