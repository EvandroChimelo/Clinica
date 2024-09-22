unit UConexao;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Stan.Def,
  Firedac.Stan.Pool,
  FireDAC.phys.PGDef,
  FireDAC.Phys.PG,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf;

type
  TConnection = class
    private
      FConnection: TFDConnection;
    public
      procedure Conectar;
      procedure Desconectar;
      function GetConnection: TFDConnection;
      constructor Create;
      destructor Destroy; override;
    end;

implementation
{ TConnection }

procedure TConnection.Conectar;
begin


  //Configura a Conexão
    FConnection.DriverName := 'PG';
    FConnection.Params.Add('Server=127.0.0.1');
    FConnection.Params.Add('Port=5433');
    FConnection.Params.Add('Database=Clinica');
    FConnection.Params.Add('User_Name=postgres');
    FConnection.Params.Add('Password=postgres');

    try
      FConnection.Connected := True;
    Except
      on E: Exception do
      raise Exception.Create('Erro ao conectar ao banco Postgres: ' + E.Message);
    end;
end;

constructor TConnection.Create;
begin
  FConnection :=TFDConnection.Create(nil);
end;

procedure TConnection.Desconectar;
begin
    if FConnection.Connected then
      FConnection.Connected := false;
end;

destructor TConnection.Destroy;
begin
  if FConnection.connected then
     FConnection.Connected := false;
     FConnection.Free;
  inherited;
end;


function TConnection.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

end.

