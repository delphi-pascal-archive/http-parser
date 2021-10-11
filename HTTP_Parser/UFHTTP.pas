unit UFHTTP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, XPMan, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ExtCtrls, RegExpr, DateUtils,
  StrUtils;

type
  TFHTTP = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    IdHTTP1: TIdHTTP;
    XPManifest1: TXPManifest;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Memo1: TMemo;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LBL_DateRequete: TLabel;
    LBL_Serveur: TLabel;
    LBL_DateModif: TLabel;
    LBL_Taille: TLabel;
    LBL_Type: TLabel;
    procedure Button1Click(Sender: TObject);
    function DateRFC1123(Date: String): TDateTime;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FHTTP: TFHTTP;

implementation

{$R *.dfm}

procedure TFHTTP.Button1Click(Sender: TObject);
var
  FormatDateHTTP: TFormatSettings;
begin
  // Récupère l'en-tête HTTP de la page
  IdHTTP1.Head(Edit1.Text);

  // Récupère les infos sur la page HTTP
  Memo1.Text := IdHTTP1.Response.RawHeaders.Text;

  // Spécifie le caractère de séparation des résultats
  IdHTTP1.Response.RawHeaders.NameValueSeparator := ':';

  // Récupère les résultats
  LBL_DateRequete.Caption := DateTimeToStr(DateRFC1123(IdHTTP1.Response.RawHeaders.Values['Date']));
  LBL_Serveur.Caption     := IdHTTP1.Response.RawHeaders.Values['Server'];
  LBL_DateModif.Caption   := DateTimeToStr(DateRFC1123(IdHTTP1.Response.RawHeaders.Values['Last-Modified']));
  LBL_Taille.Caption      := IdHTTP1.Response.RawHeaders.Values['Content-Length'] + ' byte(s)';
  LBL_Type.Caption        := IdHTTP1.Response.RawHeaders.Values['Content-Type'];
end;     

function TFHTTP.DateRFC1123(Date: String): TDateTime;    
const
  // Expression pour le décodage des dates
  ExprReg = '([A-Za-z]{3}), (\d{2}) ([A-Za-z]{3}) (\d{4}) (\d{2}):(\d{2}):(\d{2}) (\w{3,})';   
  // Liste des mois de l'année
  ListeMois: array[1..12] of String = ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
var
  EvalExprReg: TRegExpr;
  Annee, Mois, Jour, Heure, Minute, Seconde: Word;
begin
  Result := 0;
  EvalExprReg := TRegExpr.Create;
  try
    EvalExprReg.Expression := ExprReg;
    if EvalExprReg.Exec(Date) then
    begin
      // Récupère les diffèrentes parties de la date
      Annee   := StrToInt(EvalExprReg.Match[4]);
      Mois    := AnsiIndexText(EvalExprReg.Match[3], ListeMois) + 1;
      Jour    := StrToInt(EvalExprReg.Match[2]);
      Heure   := StrToInt(EvalExprReg.Match[5]);
      Minute  := StrToInt(EvalExprReg.Match[6]);
      Seconde := StrToInt(EvalExprReg.Match[7]);

      // Encode la date 
      Result  := EncodeDateTime(Annee, Mois, Jour, Heure, Minute, Seconde, 0);
    end;
  finally
    EvalExprReg.Free;
  end;
end;

end.

