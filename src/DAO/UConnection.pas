unit UConnection;

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
  FireDAC.UI.Intf,
  FireDAC.Stan.Async;

type
  TConnection = class
    private
      class var FInstance: TConnection;
      FConnection: TFDConnection;
      constructor CreatePrivate;

    public
      class function GetInstance: TConnection;
      function GetConnection: TFDConnection;
      procedure Conectar;
      procedure Desconectar;
      destructor Destroy; override;
      constructor Create;
    end;

implementation
{ TConnection }

procedure TConnection.Conectar;
begin
  if not FConnection.Connected then
    FConnection.Connected := True;

end;

constructor TConnection.Create;
begin
  raise Exception.Create('Use TConnection.GetInstance para acessar a conex�o');
end;

constructor TConnection.CreatePrivate;
begin
  FConnection := TFDConnection.Create(nil);

  //Configura a Conex�o
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

procedure TConnection.Desconectar;
begin
    if FConnection.Connected then
      FConnection.Connected := false;
end;

destructor TConnection.Destroy;
begin
  Desconectar;
  FConnection.free;
  inherited;
end;


function TConnection.GetConnection: TFDConnection;
begin
  if Assigned(FConnection) then
      Result := FConnection
    else
      raise Exception.Create('Conex�o n�o criada ou j� liberada');
end;

class function TConnection.GetInstance: TConnection;
begin
  if not Assigned(FInstance) then
    FInstance := TConnection.CreatePrivate;

  Result := FInstance;
end;

end.

