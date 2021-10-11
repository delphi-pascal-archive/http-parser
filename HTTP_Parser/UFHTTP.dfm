object FHTTP: TFHTTP
  Left = 215
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'HTTP Parser'
  ClientHeight = 265
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 30
    Height = 16
    Caption = 'URL:'
    FocusControl = Edit1
  end
  object Edit1: TEdit
    Left = 48
    Top = 8
    Width = 289
    Height = 25
    TabOrder = 0
    Text = 'http://www.delphisources.ru/'
  end
  object Button1: TButton
    Left = 344
    Top = 8
    Width = 33
    Height = 25
    Caption = '>>'
    TabOrder = 1
    OnClick = Button1Click
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 40
    Width = 369
    Height = 217
    ActivePage = TabSheet2
    TabOrder = 2
    object TabSheet2: TTabSheet
      Caption = 'Version'
      ImageIndex = 1
      object Label2: TLabel
        Left = 10
        Top = 10
        Width = 51
        Height = 16
        Caption = 'Created:'
      end
      object Label3: TLabel
        Left = 10
        Top = 31
        Width = 72
        Height = 16
        Caption = 'Server type:'
      end
      object Label4: TLabel
        Left = 10
        Top = 52
        Width = 103
        Height = 16
        Caption = 'Last modification:'
      end
      object Label5: TLabel
        Left = 10
        Top = 73
        Width = 52
        Height = 16
        Caption = 'File size:'
      end
      object Label6: TLabel
        Left = 10
        Top = 94
        Width = 77
        Height = 16
        Caption = 'Content type:'
      end
      object LBL_DateRequete: TLabel
        Left = 183
        Top = 10
        Width = 46
        Height = 16
        Caption = 'Inconnu'
      end
      object LBL_Serveur: TLabel
        Left = 183
        Top = 31
        Width = 46
        Height = 16
        Caption = 'Inconnu'
      end
      object LBL_DateModif: TLabel
        Left = 183
        Top = 52
        Width = 46
        Height = 16
        Caption = 'Inconnu'
      end
      object LBL_Taille: TLabel
        Left = 183
        Top = 73
        Width = 46
        Height = 16
        Caption = 'Inconnu'
      end
      object LBL_Type: TLabel
        Left = 183
        Top = 94
        Width = 46
        Height = 16
        Caption = 'Inconnu'
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'HTTP responce'
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 361
        Height = 186
        Align = alClient
        Color = clBtnFace
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 328
    Top = 40
  end
  object XPManifest1: TXPManifest
    Left = 296
    Top = 40
  end
end
