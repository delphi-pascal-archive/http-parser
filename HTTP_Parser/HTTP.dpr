program HTTP;

uses
  Forms,
  UFHTTP in 'UFHTTP.pas' {FHTTP};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Test HTTP';
  Application.CreateForm(TFHTTP, FHTTP);
  Application.Run;
end.
